package com.skillquest.Controller;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Entity.Business;
import com.skillquest.Entity.Tasks;
import com.skillquest.Repository.LoginRepository;
import com.skillquest.Service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        LoginDTOs loginDTOs = new LoginDTOs();

        loginDTOs.setRole(req.getParameter("choose"));
        loginDTOs.setEmail(req.getParameter("email"));
        loginDTOs.setPassword(req.getParameter("password"));

        System.out.println("hello i am at controller");
        UserInfoDTOs userInfoDTOs = loginService.loginUsers(loginDTOs);

        System.out.println(LoginRepository.isFound);

        System.out.println(loginDTOs.getRole());
        if(LoginRepository.isFound){
            switch (loginDTOs.getRole()){
                case "admin" :{
                    System.out.println("hello i am admin");
                    //get all the panding users
                    List<Object> allpendingUsers = loginService.getAllPendingUsers();
                    System.out.println(allpendingUsers);

                    // getting all the users
                    List<Object> allUsers = loginService.getALlUsers();

                    //getting all the pending tasks
                    List<TasksDTOs> allpendingTasks = loginService.getAllPendingTasks();

                    req.setAttribute("allpendingUsers", allpendingUsers);
                    req.setAttribute("allUsers", allUsers);
                    req.setAttribute("allpendingTasks", allpendingTasks);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "student" :{
                    System.out.println("hello");
                    if(userInfoDTOs.getRole().equals("student")){
                        req.setAttribute("userInfo", userInfoDTOs);
                    }


                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/studentDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "business" :{
                    //send id and business name to dashboard
                    if(userInfoDTOs.getRole().equals("business")){
                        req.setAttribute("userInfo", userInfoDTOs);
                    }

                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/businessDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }

            }
        }
        else{
            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
