package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Repository.CompletedTaskRepository;

import java.util.List;

public class CompletedTaskService {

    CompletedTaskRepository completedTaskRepository = new CompletedTaskRepository();

    public void saveCompletedTasks(int taskId, TasksDTOs tasksDTOs){

        completedTaskRepository.saveCompletedTasks(taskId, tasksDTOs);
    }

    public UserInfoDTOs getUserInfo(int studentId){

        return completedTaskRepository.getUserInfo(studentId);
    }

    public List<TasksDTOs> getAllAvailableTasks(){

        return  completedTaskRepository.getAllAvailableTasks();
    }

    public List<TasksDTOs> getAllStudentClaimTasks(int studentId){

        return completedTaskRepository.getAllStudentClaimTasks(studentId);
    }
}
