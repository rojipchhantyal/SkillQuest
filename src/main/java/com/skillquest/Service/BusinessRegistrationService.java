package com.skillquest.Service;

import com.skillquest.DTOs.RegisterBusinessDTOs;
import com.skillquest.Entity.Business;
import com.skillquest.Repository.BusinessRegistrationRepository;

public class BusinessRegistrationService {

    BusinessRegistrationRepository businessRegistrationRepository = new BusinessRegistrationRepository();

    public void registerBusiness(RegisterBusinessDTOs registerBusinessDTOs){

        Business business = new Business();

        business.setContactName(registerBusinessDTOs.getContactName());
        business.setEmail(registerBusinessDTOs.getEmail());
        business.setBusinessName(registerBusinessDTOs.getBusinessName());
        business.setBusinesstype(registerBusinessDTOs.getBusinesstype());
        business.setPhone(registerBusinessDTOs.getPhone());
        business.setLocation(registerBusinessDTOs.getLocation());
        business.setPassword(registerBusinessDTOs.getPassword());
        business.setStatus(registerBusinessDTOs.getStatus());
        business.setRegistredDate(registerBusinessDTOs.getRegistredDate());

        System.out.println("working service layer");

        businessRegistrationRepository.saveBusiness(business);
        System.out.println(business);
    }
}
