package com.skillquest.Controller;

import com.skillquest.Service.ClaimTasksStudentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/claimTasks/*")
public class ClaimTasksStudentController extends HttpServlet {

    ClaimTasksStudentService claimTasksStudentService = new ClaimTasksStudentService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathVar = req.getPathInfo();
        int taskId = 0;
        int stuedentId = Integer.parseInt(req.getParameter("studentId"));

        if(pathVar != null && pathVar.length() > 0){
            taskId = Integer.parseInt(pathVar.substring(1));
        }

        System.out.println(stuedentId + " " + taskId);
        claimTasksStudentService.claimTaskById(stuedentId, taskId);
    }
}
