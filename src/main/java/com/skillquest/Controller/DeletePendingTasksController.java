package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Service.DeletePendingTasksService;
import com.skillquest.Service.LoginService;
import com.skillquest.Service.PostTasksService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/deletePendingTask/*")
public class DeletePendingTasksController extends HttpServlet {

    DeletePendingTasksService deletePendingTasksService = new DeletePendingTasksService();
    LoginService loginService = new LoginService();
    PostTasksService postTasksService = new PostTasksService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int businessId = Integer.parseInt(req.getParameter("businessId"));

        String pathVar = req.getPathInfo();
        int taskId = 0;

        if(pathVar != null && !pathVar.isEmpty()){
            taskId = Integer.parseInt(pathVar.substring(1));
        }
        else{
            //here return to the page with message
        }

        deletePendingTasksService.deletePendingTaskById(taskId);

        //get all the tasks that the business posted
        List<TasksDTOs> allBusinessPostedTask = loginService.getAllBusinessPostedTask(businessId);

        //getting all the pending tasks of the business

        List<TasksDTOs> allBusinessPendingTasks = loginService.getAllBusinessPendingTasks(businessId);

        //all the total counter of th business
        TotalCounterDTOs totalCounterDTOs =  loginService.getAllBusinessInfo(businessId);

        //all the business active tasks
        List<TasksDTOs> allBusinessActiveTasks = loginService.getAllBusinessActiveTasks(businessId);

        //all business completed tasks
        List<TasksDTOs> allBusinessCompletedTasks = loginService.getAllBusinessCompletedTasks(businessId);

        UserInfoDTOs userInfoDTOs = postTasksService.getUserInfo(businessId);

        req.setAttribute("allPostedTasks", allBusinessPostedTask);
        req.setAttribute("allPendingTasks", allBusinessPendingTasks);
        req.setAttribute("allActiveTasks", allBusinessActiveTasks);
        req.setAttribute("allCompletedTasks", allBusinessCompletedTasks);
        req.setAttribute("totalInfo", totalCounterDTOs);
        req.setAttribute("userInfo", userInfoDTOs);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/businessDashboard.jsp");
        dispatcher.forward(req, resp);
    }
}
