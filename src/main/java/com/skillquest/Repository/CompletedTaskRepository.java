package com.skillquest.Repository;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CompletedTaskRepository extends DBConnection {

    public void saveCompletedTasks(int taskId, TasksDTOs tasksDTOs){

        String query = "INSERT INTO completed_tasks (student_id, business_id, task_id, file_name, file_type, business_msg, github_link, submitted_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, tasksDTOs.getStudent_id());

            ps.setInt(2, tasksDTOs.getBusiness_id());
            ps.setInt(3, taskId);
            ps.setString(4, tasksDTOs.getFileName());
            ps.setString(5, tasksDTOs.getFileType());
            ps.setString(6, tasksDTOs.getBusinessMsg());
            ps.setString(7, tasksDTOs.getGithubLink());
            ps.setString(8, tasksDTOs.getCompleteDate());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }


        String query2 = "UPDATE tasks SET status = 'Completed' WHERE task_id = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query2)) {
            ps.setInt(1, taskId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
