package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Repository.CompletedTaskRepository;

public class CompletedTaskService {

    CompletedTaskRepository completedTaskRepository = new CompletedTaskRepository();

    public void saveCompletedTasks(int taskId, TasksDTOs tasksDTOs){

        completedTaskRepository.saveCompletedTasks(taskId, tasksDTOs);
    }
}
