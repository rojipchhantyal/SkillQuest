package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.Service.ComplitionApproveService;
import com.skillquest.Service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminCompletionResponse/*")
public class ComplitionApproveController extends HttpServlet {

    ComplitionApproveService complitionApproveService = new ComplitionApproveService();
    LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int taskId = 0;

        String pathInfo = req.getPathInfo();

        if(pathInfo != null && !pathInfo.isEmpty()){
            taskId = Integer.parseInt(pathInfo.substring(1));
        }

        //we collect form field to know what we performing
        String perform = req.getParameter("status");

        //collect the amount and student id
        double amount = Double.parseDouble(req.getParameter("budget"));
        int intAmount = (int) amount;
        int studentId = Integer.parseInt(req.getParameter("studentId"));

        System.out.println(intAmount);

        if(perform.equals("approve")){
            complitionApproveService.markAsAccepted(taskId);

            //updaing the student fund
            complitionApproveService.addFundToStudent(intAmount, studentId);
        }
        else{
            complitionApproveService.markAsRejected(taskId);
        }

        List<Object> allpendingUsers = loginService.getAllPendingUsers();
        System.out.println(allpendingUsers);

        // getting all the users
        List<Object> allUsers = loginService.getALlUsers();

        //getting all the pending tasks
        List<TasksDTOs> allpendingTasks = loginService.getAllPendingTasks();

        TotalCounterDTOs totalCounterDTOs = loginService.getAllTotalInfo();

        List<TasksDTOs> allCompletionPending = loginService.getAllCompletionPendingTasks();
        req.setAttribute("allPendingCompletionTasks", allCompletionPending);

        req.setAttribute("allpendingUsers", allpendingUsers);
        req.setAttribute("allUsers", allUsers);
        req.setAttribute("allpendingTasks", allpendingTasks);
        req.setAttribute("totalInfo", totalCounterDTOs);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/adminDashboard.jsp");
        dispatcher.forward(req, resp);
    }
}
