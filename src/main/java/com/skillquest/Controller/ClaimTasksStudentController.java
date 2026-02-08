package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Service.ClaimTasksStudentService;
import com.skillquest.Service.CompletedTaskService;
import com.skillquest.Service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/claimTasks/*")
public class ClaimTasksStudentController extends HttpServlet {

    ClaimTasksStudentService claimTasksStudentService = new ClaimTasksStudentService();
    LoginService loginService = new LoginService();

    int stuedentId;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathVar = req.getPathInfo();
        int taskId = 0;
        stuedentId = Integer.parseInt(req.getParameter("studentId"));

        if(pathVar != null && pathVar.length() > 0){
            taskId = Integer.parseInt(pathVar.substring(1));
        }

        System.out.println(stuedentId + " " + taskId);
        claimTasksStudentService.claimTaskById(stuedentId, taskId);

        // getting all the available tasks
        List<TasksDTOs> allAvailableTasks = claimTasksStudentService.getAllAvailableTasks();

        //getting all the student claim tasks
        List<TasksDTOs> allStudentClainTasks = claimTasksStudentService.getAllStudentClaimTasks(stuedentId);

        TotalCounterDTOs totalCounterDTOs = loginService.getAllStudentInfo(stuedentId);

        List<TasksDTOs> allStudentCompletedTasks = loginService.getAllStudentCompletedTasks(stuedentId);

        UserInfoDTOs userInfoDTOs = claimTasksStudentService.getUserInfo(stuedentId);

        req.setAttribute("allAvailableTasks", allAvailableTasks);
        req.setAttribute("allStudentClaimTasks", allStudentClainTasks);
        req.setAttribute("allStudentCompletedTasks", allStudentCompletedTasks);
        req.setAttribute("totalInfo", totalCounterDTOs);
        req.setAttribute("userInfo", userInfoDTOs);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/studentDashboard.jsp");


        dispatcher.forward(req, resp);
    }
}
