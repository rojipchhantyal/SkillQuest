package com.skillquest.Service;

import com.skillquest.Repository.ApproveRegistrationRepository;

import java.util.List;

public class ApproveRegistrationService {

    ApproveRegistrationRepository approveRegistrationRepository = new ApproveRegistrationRepository();
    public boolean approveUser(int id){

        return approveRegistrationRepository.approveUserById(id);
    }
    public List<Object> getAllPendingUsers(){
        return approveRegistrationRepository.getAllPendingUsers();
    }

    public List<Object> getAllUsers(){

        return approveRegistrationRepository.getAllusers();
    }
}
