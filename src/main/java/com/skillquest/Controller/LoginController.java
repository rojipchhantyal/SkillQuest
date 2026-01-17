package com.skillquest.Controller;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
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

                    TotalCounterDTOs totalCounterDTOs = loginService.getAllTotalInfo();

                    req.setAttribute("allpendingUsers", allpendingUsers);
                    req.setAttribute("allUsers", allUsers);
                    req.setAttribute("allpendingTasks", allpendingTasks);
                    req.setAttribute("totalInfo", totalCounterDTOs);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "student" :{
                    System.out.println("hello");
                    if(userInfoDTOs.getRole().equals("student")){
                        req.setAttribute("userInfo", userInfoDTOs);
                    }

                    //sending the avialable tasks

                    List<TasksDTOs> allAvailableTasks = loginService.getAllAvailableTasks();
                    List<TasksDTOs> allStudentClaimTasks = loginService.getAllClaimTasks(userInfoDTOs.getId());
                    TotalCounterDTOs totalCounterDTOs = loginService.getAllStudentInfo(userInfoDTOs.getId());

                    req.setAttribute("allAvailableTasks", allAvailableTasks);
                    req.setAttribute("allStudentClaimTasks", allStudentClaimTasks);
                    req.setAttribute("totalInfo", totalCounterDTOs);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/studentDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "business" :{
                    //send id and business name to dashboard
                    if(userInfoDTOs.getRole().equals("business")){
                        req.setAttribute("userInfo", userInfoDTOs);
                    }

                    //get all the tasks that the business posted
                    List<TasksDTOs> allBusinessPostedTask = loginService.getAllBusinessPostedTask(userInfoDTOs.getId());

                    //all the total counter of th business
                    TotalCounterDTOs totalCounterDTOs =  loginService.getAllBusinessInfo(userInfoDTOs.getId());

                    req.setAttribute("allPostedTasks", allBusinessPostedTask);
                    req.setAttribute("totalInfo", totalCounterDTOs);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/businessDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }

            }
        }
        else{
            req.setAttribute("loginFailed", "Invalid email or password");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
