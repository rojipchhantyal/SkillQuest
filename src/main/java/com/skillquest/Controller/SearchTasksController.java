package com.skillquest.Controller;

import com.skillquest.DTOs.SearchKeywordDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.MainService;
import com.skillquest.Service.SearchTasksService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchTasks")
public class SearchTasksController extends HttpServlet {

    SearchTasksService searchTasksService = new SearchTasksService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SearchKeywordDTOs searchKeywordDTOs = new SearchKeywordDTOs();

        //collect the keywords to search
        searchKeywordDTOs.setTittle(req.getParameter("tittle"));
        searchKeywordDTOs.setLocation(req.getParameter("location"));
        searchKeywordDTOs.setType(req.getParameter("type"));

        List<TasksDTOs> allTasks = searchTasksService.searchTask(searchKeywordDTOs);

        int totalTaskCounter = searchTasksService.getCountTask(searchKeywordDTOs);

        req.setAttribute("allTasks", allTasks);
        req.setAttribute("taskCounter", totalTaskCounter);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");
        dispatcher.forward(req, resp);

    }
}
