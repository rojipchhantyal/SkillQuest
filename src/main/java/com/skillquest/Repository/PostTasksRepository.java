package com.skillquest.Repository;

import com.skillquest.Entity.Business;
import com.skillquest.Entity.Student;
import com.skillquest.Entity.Tasks;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PostTasksRepository extends DBConnection {

    public void saveTasks(Tasks tasks){

        String query = "INSERT INTO tasks (title, business_id, description, task_type, location, budget, deadline, created_at) VALUES(? , 46, ?, ?, ?, ?, ?, ?)";
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setString(1, tasks.getTitle());
            ps.setString(2, tasks.getDescription());
            ps.setString(3, tasks.getTask_type());
            ps.setString(4, tasks.getLocation());
            ps.setFloat(5, Float.parseFloat(tasks.getBudget()));
            ps.setString(6, tasks.getDeadline());
            ps.setString(7, tasks.getCreated_at());

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
