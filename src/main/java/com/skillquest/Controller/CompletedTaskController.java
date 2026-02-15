package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Service.CompletedTaskService;
import com.skillquest.Service.LoginService;
import com.skillquest.Util.CurrentTimeInFormated;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@WebServlet("/submitCompleteTasks/*")
@MultipartConfig
public class CompletedTaskController extends HttpServlet {

    CompletedTaskService completedTaskService = new CompletedTaskService();
    LoginService loginService = new LoginService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //get path var info
        String pathVar = req.getPathInfo();
        int taskId = 0;

        if(pathVar != null && !pathVar.isEmpty()){
            taskId = Integer.parseInt(pathVar.substring(1));
        }

        // Get form fields
        Part filePart = req.getPart("task-file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String fileType = filePart.getContentType();

        String businessMsg = req.getParameter("message-business");
        String githubLink  = req.getParameter("github-link");
        int businessId = Integer.parseInt(req.getParameter("business-id"));
        int studentId = Integer.parseInt(req.getParameter("student-id"));

        /// Save file to disk (uploads folder)
        String uploadDir = getServletContext().getRealPath("/uploads");
        File uploadFolder = new File(uploadDir);

        // Ensure the uploads directory exists
        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // Create a File object for the uploaded file
        File file = new File(uploadFolder, fileName);

        // Copy the uploaded file into the folder, replacing if it already exists
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed.");
            return; // stop execution if file save fails
        }

        TasksDTOs tasksDTOs = new TasksDTOs();

        tasksDTOs.setBusiness_id(businessId);
        tasksDTOs.setStudent_id(studentId);
        tasksDTOs.setFileName(fileName);
        tasksDTOs.setFileType(fileType);
        tasksDTOs.setBusinessMsg(businessMsg);
        tasksDTOs.setGithubLink(githubLink);
        tasksDTOs.setCompleteDate(CurrentTimeInFormated.getCurrentTimeInFormated());

        //redirect to the student dashboard with the data
        //sending the avialable tasks

        List<TasksDTOs> allAvailableTasks = completedTaskService.getAllAvailableTasks();

        List<TasksDTOs> allStudentClaimTasks = completedTaskService.getAllStudentClaimTasks(studentId);


        TotalCounterDTOs totalCounterDTOs = loginService.getAllStudentInfo(studentId);

        List<TasksDTOs> allStudentCompletedTasks = loginService.getAllStudentCompletedTasks(studentId);

        UserInfoDTOs userInfoDTOs = completedTaskService.getUserInfo(studentId);

        req.setAttribute("allAvailableTasks", allAvailableTasks);
        req.setAttribute("allStudentClaimTasks", allStudentClaimTasks);
        req.setAttribute("allStudentCompletedTasks", allStudentCompletedTasks);
        req.setAttribute("totalInfo", totalCounterDTOs);
        req.setAttribute("userInfo", userInfoDTOs);

        completedTaskService.saveCompletedTasks(taskId, tasksDTOs);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/components/studentDashboard.jsp");
        dispatcher.forward(req, resp);
    }
}
