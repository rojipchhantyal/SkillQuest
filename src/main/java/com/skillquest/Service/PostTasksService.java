package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Entity.Tasks;
import com.skillquest.Repository.PostTasksRepository;
import com.skillquest.Util.CurrentTimeInFormated;

public class PostTasksService {

    PostTasksRepository postTasksRepository = new PostTasksRepository();

    public void saveTasks(TasksDTOs tasksDTOs){

        Tasks tasks = new Tasks();

        tasks.setTitle(tasksDTOs.getTitle());
        tasks.setDescription(tasksDTOs.getDescription());
        tasks.setTask_type(tasksDTOs.getTask_type());
        tasks.setLocation(tasksDTOs.getLocation());
        tasks.setBudget(tasksDTOs.getBudget());
        tasks.setDeadline(tasksDTOs.getDeadline());
        tasks.setCreated_at(CurrentTimeInFormated.getCurrentTimeInFormated());

        postTasksRepository.saveTasks(tasks);

    }
}
