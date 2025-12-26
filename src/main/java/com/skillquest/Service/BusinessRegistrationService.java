package com.skillquest.Service;

import com.skillquest.DTOs.RegisterBusinessDTOs;
import com.skillquest.Entity.Business;

public class BusinessRegistrationService {

    public RegisterBusinessDTOs registerBusiness(RegisterBusinessDTOs registerBusinessDTOs){

        Business business = new Business();

        business.setContactName(registerBusinessDTOs.getContactName());
        business.setEmail(registerBusinessDTOs.getEmail());
        business.setBusinessName(registerBusinessDTOs.getBusinessName());
        business.setBusinesstype(registerBusinessDTOs.getBusinesstype());
        business.setPhone(registerBusinessDTOs.getPhone());
        business.setLocation(registerBusinessDTOs.getLocation());
        business.setPassword(registerBusinessDTOs.getPassword());

        System.out.println(business);

        return null;
    }
}
