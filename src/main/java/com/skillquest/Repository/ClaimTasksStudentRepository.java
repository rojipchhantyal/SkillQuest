package com.skillquest.Repository;

import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ClaimTasksStudentRepository extends DBConnection {

    public void claimTaskById(int studentId, int taskId){
        String query = "UPDATE tasks SET student_id = ? WHERE task_id = ?";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setInt(1, studentId);
            ps.setInt(2, taskId);

            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }

    }
}
