package com.skillquest.Repository;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MainRepository extends DBConnection {

    public List<TasksDTOs> getAllTasks(){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.budget " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Approved'";


        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //check if its student or business
                TasksDTOs tasks = new TasksDTOs();
                tasks.setId(rs.getInt("task_id"));
                tasks.setBusiness_id(rs.getInt("business_id"));
                tasks.setBusinessName(rs.getString("university_businessName"));
                tasks.setTitle(rs.getString("title"));
                tasks.setDescription(rs.getString("description"));
                tasks.setTask_type(rs.getString("task_type"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));

                System.out.println("index  tasks repo");
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }
}
