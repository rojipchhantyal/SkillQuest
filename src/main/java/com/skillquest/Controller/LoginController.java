package com.skillquest.Controller;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.Entity.Business;
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
        boolean isFound = loginService.loginUsers(loginDTOs);

        System.out.println(isFound);

        System.out.println(loginDTOs.getRole());
        if(isFound){
            switch (loginDTOs.getRole()){
                case "admin" :{
                    System.out.println("hello i am admin");
                    //get all the panding users
                    List<Object> allpendingUsers = loginService.getAllPendingUsers();
                    System.out.println(allpendingUsers);

                    for(Object list : allpendingUsers){

                        System.out.println(list instanceof Business);
                    }

                    req.setAttribute("allpendingUsers", allpendingUsers);
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "student" :{
                    System.out.println("hello");
                    RequestDispatcher dispatcher = req.getRequestDispatcher("/components/studentDashboard.jsp");
                    dispatcher.forward(req, resp);
                    break;
                }
                case "business" :{
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
