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

        businessDTOs.setContactName(req.getParameter("contactName"));
        businessDTOs.setEmail(req.getParameter("email"));
        businessDTOs.setBusinessName(req.getParameter("businessName"));
        businessDTOs.setBusinesstype(req.getParameter("businessType"));
        businessDTOs.setPhone(req.getParameter("phone"));
        businessDTOs.setLocation(req.getParameter("location"));
        businessDTOs.setPassword(req.getParameter("firstPassword"));
        businessDTOs.setConfirmPassword(req.getParameter("confirmPassword"));
        businessDTOs.setRegistredDate(CurrentTimeInFormated.getCurrentTimeInFormated());

        businessRegistrationService.registerBusiness(businessDTOs);

        if (BusinessRegistrationRepository.isSuccessfullyExcuted) {
            req.setAttribute("message", "student registered successfully! wait for admin approval to login");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");
            System.out.println("yes");

            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed. Please try again letter.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/components/index.jsp");
            System.out.println("no");
            dispatcher.forward(req, resp);
        }

    }
}
