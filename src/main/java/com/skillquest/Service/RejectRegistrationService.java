package com.skillquest.Service;

import com.skillquest.Repository.ApproveRegistrationRepository;
import com.skillquest.Repository.RejectRegistrationRepository;

import java.util.List;

public class RejectRegistrationService {

    RejectRegistrationRepository rejectRegistrationRepository = new RejectRegistrationRepository();
    public boolean rejectUser(int id){

        return rejectRegistrationRepository.rejectUserById(id);
    }
    public List<Object> getAllPendingUsers(){

        return rejectRegistrationRepository.getAllPendingUsers();
    }
}
