package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.Service.LoginService;
import com.skillquest.Service.RejectRegistrationService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/rejectRegistration/*")
public class RejectRegistrationController extends HttpServlet {

    RejectRegistrationService registrationService = new RejectRegistrationService();
    LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //collecting the path value
        String pathVar = req.getPathInfo();
        int apprvingUserId = 0;

        if(pathVar != null && pathVar.length() > 0){
            apprvingUserId = Integer.parseInt(pathVar.substring(1));
        }
        else {
            return;
        }
        boolean isExcuted = registrationService.rejectUser(apprvingUserId);
        if(isExcuted){
            req.setAttribute("success", "Rejected User!");
            System.out.println("excuted");

            List<Object> allpendingUsers = registrationService.getAllPendingUsers();
            req.setAttribute("allpendingUsers", allpendingUsers);

            List<Object> allUsers = registrationService.getAllUsers();
            req.setAttribute("allUsers", allUsers);

            List<TasksDTOs> allpendingTasks = registrationService.getAllPendingTasks();
            req.setAttribute("allpendingTasks", allpendingTasks);

            List<TasksDTOs> allCompletionPending = loginService.getAllCompletionPendingTasks();
            req.setAttribute("allPendingCompletionTasks", allCompletionPending);

            TotalCounterDTOs totalCounterDTOs = loginService.getAllTotalInfo();
            req.setAttribute("totalInfo", totalCounterDTOs);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
            dispatcher.forward(req, resp);
        }
        else{
            req.setAttribute("failed", "Failed to Reject User!");
            System.out.println("problem");

            List<Object> allpendingUsers = registrationService.getAllPendingUsers();
            req.setAttribute("allpendingUsers", allpendingUsers);

            TotalCounterDTOs totalCounterDTOs = loginService.getAllTotalInfo();
            req.setAttribute("totalInfo", totalCounterDTOs);

            List<TasksDTOs> allCompletionPending = loginService.getAllCompletionPendingTasks();
            req.setAttribute("allPendingCompletionTasks", allCompletionPending);

            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
