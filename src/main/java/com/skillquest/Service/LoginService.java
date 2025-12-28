package com.skillquest.Service;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.Repository.LoginRepository;

import java.util.List;

public class LoginService {

    LoginRepository loginRepository = new LoginRepository();

    public boolean loginUsers(LoginDTOs loginDTOs){

        return loginRepository.findUser(loginDTOs);
    }
    public List<Object> getAllPendingUsers(){

        return loginRepository.getAllPendingUsers();
    }
}
