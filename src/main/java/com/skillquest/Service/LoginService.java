package com.skillquest.Service;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Repository.LoginRepository;

import java.util.List;

public class LoginService {

    LoginRepository loginRepository = new LoginRepository();

    public UserInfoDTOs loginUsers(LoginDTOs loginDTOs){

        return loginRepository.findUser(loginDTOs);
    }

    public List<Object> getAllPendingUsers(){

        return loginRepository.getAllPendingUsers();
    }

    public List<Object> getALlUsers(){

        return loginRepository.getAllUsers();
    }

    public List<TasksDTOs> getAllPendingTasks(){

        return loginRepository.getAllPendingTasks();
    }

    public List<TasksDTOs> getAllAvailableTasks(){

        return loginRepository.getAllAvailableTasks();
    }

    public List<TasksDTOs> getAllClaimTasks(int studentId){

        return loginRepository.getAllClaimTasks(studentId);
    }

    public List<TasksDTOs> getAllBusinessPostedTask(int businessId){

        return loginRepository.getAllBusinessPostedTask(businessId);
    }

    public TotalCounterDTOs getAllTotalInfo(){

        return loginRepository.getAllTotalInfo();
    }

    public TotalCounterDTOs getAllStudentInfo(int studentId){

        return loginRepository.getAllStudentInfo(studentId);
    }

    public TotalCounterDTOs getAllBusinessInfo(int businessId){

        return loginRepository.getAllBusinessInfo(businessId);
    }

    public List<TasksDTOs> getAllBusinessPendingTasks(int businessId){

        return loginRepository.getAllBusinessPendingTasks(businessId);
    }

    public List<TasksDTOs> getAllBusinessActiveTasks(int businessId){

        return loginRepository.getAllBusinessActiveTasks(businessId);
    }
}
