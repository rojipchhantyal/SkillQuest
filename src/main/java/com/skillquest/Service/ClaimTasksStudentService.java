package com.skillquest.Service;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Repository.ClaimTasksStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ClaimTasksStudentService {

    ClaimTasksStudentRepository claimTasksStudentRepository = new ClaimTasksStudentRepository();

    public void claimTaskById(int studentId, int taskId){

        claimTasksStudentRepository.claimTaskById(studentId, taskId);
    }

    public List<TasksDTOs> getAllStudentClaimTasks(int studentId){

        return claimTasksStudentRepository.getAllStudentClaimTasks(studentId);
    }

    public List<TasksDTOs> getAllAvailableTasks(){

        return claimTasksStudentRepository.getAllAvailableTasks();
    }
    public UserInfoDTOs getUserInfo(int studentId){

      return claimTasksStudentRepository.getUserInfo(studentId);
    }
}
