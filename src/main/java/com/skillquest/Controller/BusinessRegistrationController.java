package com.skillquest.Controller;

import com.skillquest.DTOs.RegisterBusinessDTOs;
import com.skillquest.Repository.BusinessRegistrationRepository;
import com.skillquest.Service.BusinessRegistrationService;
import com.skillquest.Util.CurrentTimeInFormated;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/registerBusiness")
public class BusinessRegistrationController extends HttpServlet {

    BusinessRegistrationService businessRegistrationService = new BusinessRegistrationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RegisterBusinessDTOs businessDTOs = new RegisterBusinessDTOs();


        String validMessage = "";
        boolean isValid = true;

        //validating the user inputs
        if(!req.getParameter("contactName").matches("^[a-zA-Z ]+$")){
            validMessage = "contact name must contain only letters";
            isValid = false;
            System.out.println("contact name failed validate");
        }
        else if(!req.getParameter("email").matches(".*\\.com$")){
            validMessage = "email must end with .com only";
            isValid = false;
            System.out.println("email failed validate");
        }
        else if(!req.getParameter("businessName").matches("^[a-zA-Z ]+$")){
            validMessage = "business name must contain only letters";
            isValid = false;
            System.out.println("business failed validate");
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
            businessDTOs.setContactName(req.getParameter("contactName"));
            businessDTOs.setEmail(req.getParameter("email"));
            businessDTOs.setBusinessName(req.getParameter("businessName"));
            businessDTOs.setBusinesstype(req.getParameter("businessType"));
            businessDTOs.setPhone(req.getParameter("phone"));
            businessDTOs.setLocation(req.getParameter("location"));
            businessDTOs.setPassword(req.getParameter("firstPassword"));
            businessDTOs.setConfirmPassword(req.getParameter("confirmPassword"));
            businessDTOs.setRegistredDate(CurrentTimeInFormated.getCurrentTimeInFormated());
        }

        if(!isValid){
            req.setAttribute("validMessage", validMessage);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/getStarted.jsp");
            dispatcher.forward(req, resp);
        }
        else {
            businessRegistrationService.registerBusiness(businessDTOs);

            if (BusinessRegistrationRepository.isSuccessfullyExcuted) {
                req.setAttribute("message", "student registered successfully! wait for admin approval to login");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/components/login.jsp");
                System.out.println("yes");

                dispatcher.forward(req, resp);
            } else {
                req.setAttribute("validMessage", "Registration failed. Please try again letter.");
                RequestDispatcher dispatcher = req.getRequestDispatcher("/components/getStarted.jsp");
                System.out.println("no");
                dispatcher.forward(req, resp);
            }
        }
    }
}
