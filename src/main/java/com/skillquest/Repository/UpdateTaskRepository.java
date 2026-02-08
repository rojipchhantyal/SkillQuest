package com.skillquest.Repository;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Entity.Tasks;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTaskRepository extends DBConnection {


    public void updateTasks(int taskId, Tasks tasks){

        String query = "UPDATE tasks SET title = ?, description = ?, task_type = ?, location = ?, budget = ?, deadline = ? WHERE task_id = ? AND business_id = ?";
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setString(1, tasks.getTitle());
            ps.setString(2, tasks.getDescription());
            ps.setString(3, tasks.getTask_type());
            ps.setString(4, tasks.getLocation());
            ps.setFloat(5, Float.parseFloat(tasks.getBudget()));
            ps.setString(6, tasks.getDeadline());

            //for task and business id
            ps.setInt(7, taskId);
            ps.setInt(8, tasks.getBusiness_id());

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
