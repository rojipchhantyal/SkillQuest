package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Entity.Tasks;
import com.skillquest.Repository.UpdateTaskRepository;

public class UpdateTaskService {

    UpdateTaskRepository updateTaskRepository = new UpdateTaskRepository();

    public void updateTasks(int taskId, TasksDTOs tasksDTOs){

        Tasks tasks = new Tasks();

        tasks.setBusiness_id(tasksDTOs.getBusiness_id());
        tasks.setTitle(tasksDTOs.getTitle());
        tasks.setDescription(tasksDTOs.getDescription());
        tasks.setTask_type(tasksDTOs.getTask_type());
        tasks.setLocation(tasksDTOs.getLocation());
        tasks.setBudget(tasksDTOs.getBudget());
        tasks.setDeadline(tasksDTOs.getDeadline());

        updateTaskRepository.updateTasks(taskId, tasks);
    }

}
