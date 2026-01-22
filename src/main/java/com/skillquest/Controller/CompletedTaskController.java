package com.skillquest.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/submitCompleteTasks/*")
@MultipartConfig
public class CompletedTaskController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pathVar = req.getPathInfo();
        int taskId = 0;

        if(pathVar != null && !pathVar.isEmpty()){
            taskId = Integer.parseInt(pathVar.substring(1));
        }

        System.out.println(taskId);
    }
}
