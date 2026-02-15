package com.skillquest.Service;

import com.skillquest.Repository.ComplitionApproveRepository;

public class ComplitionApproveService {

    ComplitionApproveRepository complitionApproveRepository = new ComplitionApproveRepository();

    public void markAsAccepted(int taskId){

        complitionApproveRepository.markAsAccepted(taskId);
    }

    public void markAsRejected(int taskId){

        complitionApproveRepository.markAsRejected(taskId);
    }

    public void addFundToStudent(int amount, int studentId){

        complitionApproveRepository.addFundToStudent(amount, studentId);
    }
}
