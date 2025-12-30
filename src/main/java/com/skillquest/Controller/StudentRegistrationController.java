package com.skillquest.Controller;

import com.skillquest.DTOs.RegisterStudentDTOs;
import com.skillquest.Repository.StudentRegistrationRepository;
import com.skillquest.Service.StudentRegistrationService;
import com.skillquest.Util.CurrentTimeInFormated;
import jakarta.servlet.RequestDispatcher;
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
        studentDTOs.setPhone(req.getParameter("phone"));
        studentDTOs.setLocation(req.getParameter("location"));
        studentDTOs.setPassword(req.getParameter("firstPassword"));
        studentDTOs.setConfirmPassword(req.getParameter("confirmPassword"));
        studentDTOs.setRegistredDate(CurrentTimeInFormated.getCurrentTimeInFormated());

        registrationService.registerStudent(studentDTOs);

        if (StudentRegistrationRepository.isSuccessfullyExcuted) {
            req.setAttribute("message", "student registered successfully! wait for admin approval to login");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");

            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed. Please try again letter.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");

            dispatcher.forward(req, resp);
        }
    }
}
