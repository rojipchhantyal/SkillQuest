package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.MainService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class MainController extends HttpServlet {

    MainService mainService = new MainService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Hello");
        List<TasksDTOs> allApprovedTasks = mainService.getAllTasks();
        int totalTaskCounter = mainService.getTotalAvailableTasks();

        req.setAttribute("allTasks", allApprovedTasks);
        req.setAttribute("taskCounter", totalTaskCounter);

        System.out.println("Total task "+ totalTaskCounter );
        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");
        dispatcher.forward(req, resp);
    }
}
