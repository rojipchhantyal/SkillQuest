package com.skillquest.Repository;

import com.skillquest.Entity.Tasks;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PostTasksRepository extends DBConnection {

    public void saveTasks(Tasks tasks){

        String query = "INSERT INTO tasks (title, business_id, description, task_type, location, budget, deadline, created_at) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setString(1, tasks.getTitle());
            ps.setInt(2,tasks.getBusiness_id());
            ps.setString(3, tasks.getDescription());
            ps.setString(4, tasks.getTask_type());
            ps.setString(5, tasks.getLocation());
            ps.setFloat(6, Float.parseFloat(tasks.getBudget()));
            ps.setString(7, tasks.getDeadline());
            ps.setString(8, tasks.getCreated_at());

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
