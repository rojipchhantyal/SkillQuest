package com.skillquest.Controller;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Service.CompletedTaskService;
import com.skillquest.Util.CurrentTimeInFormated;
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

@WebServlet("/submitCompleteTasks/*")
@MultipartConfig
public class CompletedTaskController extends HttpServlet {

    CompletedTaskService completedTaskService = new CompletedTaskService();

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

        System.out.println("asdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
        System.out.println(studentId);

        // Save file to disk (uploads folder)
        String uploadDir = getServletContext().getRealPath("/uploads");
        File uploadFolder = new File(uploadDir);
        if (!uploadFolder.exists()) uploadFolder.mkdirs();

        File file = new File(uploadFolder, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        TasksDTOs tasksDTOs = new TasksDTOs();

        tasksDTOs.setBusiness_id(businessId);
        tasksDTOs.setStudent_id(studentId);
        tasksDTOs.setFileName(fileName);
        tasksDTOs.setFileType(fileType);
        tasksDTOs.setBusinessMsg(businessMsg);
        tasksDTOs.setGithubLink(githubLink);
        tasksDTOs.setCompleteDate(CurrentTimeInFormated.getCurrentTimeInFormated());

        completedTaskService.saveCompletedTasks(taskId, tasksDTOs);
    }
}
