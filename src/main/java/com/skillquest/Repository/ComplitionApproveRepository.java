package com.skillquest.Repository;

import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ComplitionApproveRepository extends DBConnection {

    public void markAsAccepted(int taskId){

        String query = "UPDATE tasks SET progression = 'Completed' WHERE task_id = ?";
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, taskId);

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void markAsRejected(int taskId){

        String query = "UPDATE tasks SET progression = 'Pending',status = 'Claimed' WHERE task_id = ?";
        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, taskId);

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void addFundToStudent(int amount, int studentId){

        String query = "UPDATE users SET fund = fund + ? WHERE id = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, amount);
            ps.setInt(2, studentId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
