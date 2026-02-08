package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.Service.BanUserService;
import com.skillquest.Service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/banUser/*")
public class BanUserController extends HttpServlet {

    BanUserService banUserService = new BanUserService();
    LoginService loginService = new LoginService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathVar = req.getPathInfo();
        int userId = 0;

        if(pathVar != null && !pathVar.isEmpty()){
            userId = Integer.parseInt(pathVar.substring(1));
        }
        else{
            //here return to the page with message
        }

        banUserService.banUserById(userId);

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
    }
}
