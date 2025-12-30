package com.skillquest.Controller;

import com.skillquest.Service.ApproveRegistrationService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/approveRegistration/*")
public class ApproveRegistrationController extends HttpServlet {

    ApproveRegistrationService approveRegistrationService = new ApproveRegistrationService();

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
        boolean isExcuted = approveRegistrationService.approveUser(apprvingUserId);
        if(isExcuted){
            req.setAttribute("success", "Approved User!");
            System.out.println("excuted");

            List<Object> allpendingUsers = approveRegistrationService.getAllPendingUsers();
            List<Object> allUsers = approveRegistrationService.getAllUsers();

            req.setAttribute("allpendingUsers", allpendingUsers);
            req.setAttribute("allUsers", allUsers);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
            dispatcher.forward(req, resp);
        }
        else{
            req.setAttribute("failed", "Failed to Approved User!");
            System.out.println("problem");

            List<Object> allpendingUsers = approveRegistrationService.getAllPendingUsers();
            List<Object> allUsers = approveRegistrationService.getAllUsers();

            req.setAttribute("allpendingUsers", allpendingUsers);
            req.setAttribute("allUsers", allUsers);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
