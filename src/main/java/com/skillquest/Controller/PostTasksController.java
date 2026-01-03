package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.PostTasksService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/postTask")
public class PostTasksController extends HttpServlet {

    PostTasksService postTasksService = new PostTasksService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TasksDTOs tasksDTOs = new TasksDTOs();

        System.out.println("post task controller");

        // Collecting the form data
        tasksDTOs.setBusiness_id(Integer.parseInt(req.getParameter("id")));
        tasksDTOs.setTitle(req.getParameter("taskTittle"));
        tasksDTOs.setDescription(req.getParameter("taskDescription"));
        tasksDTOs.setTask_type(req.getParameter("taskType"));
        tasksDTOs.setLocation(req.getParameter("location"));
        tasksDTOs.setBudget(req.getParameter("budget"));
        tasksDTOs.setDeadline(req.getParameter("deadline"));

        postTasksService.saveTasks(tasksDTOs);

    }
}
