package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.IsApprovedTasksService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminResponseToTasks/*")
public class IsApproveTasksController extends HttpServlet {

    IsApprovedTasksService isApprovedTasksService = new IsApprovedTasksService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathVar = req.getPathInfo();
        String isApproved = req.getParameter("isApproved");
        System.out.println(isApproved);
        System.out.println(pathVar);
        int approvingTaskId = 0;

        if(pathVar != null && pathVar.length() > 0){
            approvingTaskId = Integer.parseInt(pathVar.substring(1));
        }

        isApprovedTasksService.isApproveSave(approvingTaskId, isApproved);

        //Since after forwarding the page all the old data will removed we have to send again
        List<Object> allpendingUsers = isApprovedTasksService.getAllPendingUsers();
        List<Object> allUsers = isApprovedTasksService.getAllUsers();
        List<TasksDTOs> allpendingTasks = isApprovedTasksService.getAllPendingTasks();

        req.setAttribute("allpendingUsers", allpendingUsers);
        req.setAttribute("allUsers", allUsers);
        req.setAttribute("allpendingTasks", allpendingTasks);

        req.setAttribute("allUsers", allUsers);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
        dispatcher.forward(req, resp);
    }
}
