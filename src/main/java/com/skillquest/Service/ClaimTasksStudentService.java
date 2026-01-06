package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Repository.ClaimTasksStudentRepository;

import java.util.List;

public class ClaimTasksStudentService {

    ClaimTasksStudentRepository claimTasksStudentRepository = new ClaimTasksStudentRepository();

    public void claimTaskById(int studentId, int taskId){

        claimTasksStudentRepository.claimTaskById(studentId, taskId);
    }

    public List<TasksDTOs> getAllStudentClaimTasks(int studentId){

        return claimTasksStudentRepository.getAllStudentClaimTasks(studentId);
    }
}
