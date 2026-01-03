package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Repository.MainRepository;

import java.util.List;

public class MainService {

    MainRepository mainRepository = new MainRepository();

    public List<TasksDTOs> getAllTasks(){

        System.out.println("index task service");
        return mainRepository.getAllTasks();
    }
}
