package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.UpdateTaskService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateTask/*")
public class UpdateTaskController extends HttpServlet {

    UpdateTaskService updateTaskService = new UpdateTaskService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int businessId = Integer.parseInt(req.getParameter("businessId"));
        String pathVar = req.getPathInfo();
        int taskId = 0;

        if(pathVar != null && !pathVar.isEmpty()){
            taskId = Integer.parseInt(pathVar.substring(1));
        }
        else{
            //here return to the page with message
        }

        //collect the data to update the table
        TasksDTOs tasksDTOs = new TasksDTOs();

        System.out.println("update task controller");

        // Collecting the form data to update the table
        tasksDTOs.setBusiness_id(businessId);
        tasksDTOs.setTitle(req.getParameter("taskTittle"));
        tasksDTOs.setDescription(req.getParameter("taskDescription"));
        tasksDTOs.setTask_type(req.getParameter("taskType"));
        tasksDTOs.setLocation(req.getParameter("location"));
        tasksDTOs.setBudget(req.getParameter("budget"));
        tasksDTOs.setDeadline(req.getParameter("deadline"));

        updateTaskService.updateTasks(taskId, tasksDTOs);



    }
}
