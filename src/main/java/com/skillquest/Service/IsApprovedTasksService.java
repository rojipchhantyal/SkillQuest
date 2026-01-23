package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.Repository.IsApprovedTasksRepository;

import java.util.List;

public class IsApprovedTasksService {

    IsApprovedTasksRepository isApprovedTasksRepository = new IsApprovedTasksRepository();

    public void isApproveSave(int id, String isApprove){

        isApprovedTasksRepository.isApproveSave(id, isApprove);
    }

    public List<Object> getAllPendingUsers(){
        return isApprovedTasksRepository.getAllPendingUsers();
    }

    public List<Object> getAllUsers(){

        return isApprovedTasksRepository.getAllusers();
    }

    public List<TasksDTOs> getAllPendingTasks(){

        return isApprovedTasksRepository.getAllPendingTasks();
    }

    public TotalCounterDTOs getAllTotalInfo() {

        return isApprovedTasksRepository.getAllTotalInfo();
    }
}
