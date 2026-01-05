package com.skillquest.Service;

import com.skillquest.Repository.ClaimTasksStudentRepository;

public class ClaimTasksStudentService {

    ClaimTasksStudentRepository claimTasksStudentRepository = new ClaimTasksStudentRepository();

    public void claimTaskById(int studentId, int taskId){

        claimTasksStudentRepository.claimTaskById(studentId, taskId);
    }

}
