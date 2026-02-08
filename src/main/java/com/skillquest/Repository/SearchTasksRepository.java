package com.skillquest.Repository;

import com.skillquest.DTOs.SearchKeywordDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchTasksRepository extends DBConnection {


    public List<TasksDTOs> searchTask(SearchKeywordDTOs searchKeywordDTOs){

        String query = "SELECT t.task_id, t.business_id, u.university_businessName, " +
                "t.title, t.description, t.task_type, t.location, t.budget, t.deadline " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Approved' " +
                "AND (t.title LIKE ? OR t.location LIKE ? OR t.task_type LIKE ?)";

        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, searchKeywordDTOs.getTittle());
            ps.setString(2, searchKeywordDTOs.getLocation());
            ps.setString(3, searchKeywordDTOs.getType());

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
                tasks.setLocation(rs.getString("location"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return allTasks;
    }

    public int getCountTask(SearchKeywordDTOs searchKeywordDTOs){
        String countQuery = "SELECT COUNT(*) AS total " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Approved' " +
                "AND (t.title LIKE ? OR t.location LIKE ? OR t.task_type LIKE ?)";

        TotalCounterDTOs totalCounterDTOs = new TotalCounterDTOs();

        int taskCounter = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(countQuery)) {

            ps.setString(1, searchKeywordDTOs.getTittle());
            ps.setString(2, searchKeywordDTOs.getLocation());
            ps.setString(3, searchKeywordDTOs.getType());

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                taskCounter = rs.getInt("total");

                System.out.println(taskCounter);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return taskCounter;
    }
}
