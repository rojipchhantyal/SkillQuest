package com.skillquest.Controller;

import com.skillquest.DTOs.RegisterStudentDTOs;
import com.skillquest.Service.StudentRegistrationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/registerStudents")
public class StudentRegistrationController extends HttpServlet {

    StudentRegistrationService registrationService = new StudentRegistrationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RegisterStudentDTOs studentDTOs = new RegisterStudentDTOs();

//        loading student data to student DTO to transfer between layers
        studentDTOs.setFullName(req.getParameter("fullName"));
        studentDTOs.setEmail(req.getParameter("email"));
        studentDTOs.setUniversityName(req.getParameter("university"));
        studentDTOs.setMajor(req.getParameter("major"));
        studentDTOs.setPhone(Long.parseLong(req.getParameter("phone")));
        studentDTOs.setLocation(req.getParameter("location"));
        studentDTOs.setPassword(req.getParameter("firstPassword"));
        studentDTOs.setConfirmPassword(req.getParameter("confirmPassword"));

        System.out.println(studentDTOs.getFullName()+"\n"+studentDTOs.getPassword());

        registrationService.registerStudent(studentDTOs);
    }
}
