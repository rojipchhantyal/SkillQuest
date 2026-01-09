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

        String validMessage = "";
        boolean isValid = true;

        //validating the user inputs
        if(!req.getParameter("fullName").matches("^[a-zA-Z ]+$")){
            validMessage = "full name must contain only letters";
            isValid = false;
            System.out.println("full name failed validate");
        }
        else if(!req.getParameter("email").matches(".*\\.com$")){
            validMessage = "email must end with .com only";
            isValid = false;
            System.out.println("email failed validate");
        }
        else if(!req.getParameter("university").matches("^[a-zA-Z]+$")){
            validMessage = "university name must contain only letters";
            isValid = false;
            System.out.println("university failed validate");
        }
        else if(!req.getParameter("major").matches("^[a-zA-Z]+$")){
            validMessage = "major must contain only letters";
            isValid = false;
            System.out.println("major failed validate");
        }
        else if(!req.getParameter("phone").matches("^(98|97)[0-9]{8}$")){
            validMessage = "phone number should start with 98 or 97 and 10 digit long";
            isValid = false;
            System.out.println("phone failed validate");
        }
        else if(!req.getParameter("location").matches("^[A-Za-z].*$")){
            validMessage = "location must start with letter";
            isValid = false;
            System.out.println("location failed validate");
        }
        else if(!req.getParameter("firstPassword").matches("^(?=.*[A-Za-z])(?=.*[^A-Za-z]).{8,}$")){
            validMessage = "password must contain one letter and one one letter charcter and atleast 8 char long";
            isValid = false;
            System.out.println(" password failed validate");
        }
        else if(!req.getParameter("firstPassword").equals(req.getParameter("confirmPassword"))){
            validMessage = "password and confirm password must be same";
            isValid = false;
            System.out.println("failed validate");
        }
        else{
            isValid = true;
            // loading student data to student DTO to transfer between layers
            studentDTOs.setFullName(req.getParameter("fullName"));
            studentDTOs.setEmail(req.getParameter("email"));
            studentDTOs.setUniversityName(req.getParameter("university"));
            studentDTOs.setMajor(req.getParameter("major"));
            studentDTOs.setPhone(req.getParameter("phone"));
            studentDTOs.setLocation(req.getParameter("location"));
            studentDTOs.setPassword(req.getParameter("firstPassword"));
            studentDTOs.setConfirmPassword(req.getParameter("confirmPassword"));
            studentDTOs.setRegistredDate(CurrentTimeInFormated.getCurrentTimeInFormated());
        }

        //check if valid success if not then send user to getStarted page with error message
        if(!isValid){
            req.setAttribute("validMessage", validMessage);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/getStarted.jsp");
            dispatcher.forward(req, resp);
        }
        else{
            registrationService.registerStudent(studentDTOs);

            if (StudentRegistrationRepository.isSuccessfullyExcuted) {
                req.setAttribute("message", "student registered successfully! wait for admin approval to login");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");

                dispatcher.forward(req, resp);
            } else {
                req.setAttribute("error", "Registration failed. Please try again letter.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");

                dispatcher.forward(req, resp);
            }
        }
    }
}
