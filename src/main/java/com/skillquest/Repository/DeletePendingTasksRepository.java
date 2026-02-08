package com.skillquest.Repository;

import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeletePendingTasksRepository extends DBConnection {

    public void deletePendingTaskById(int taskId){

        String query = "DELETE FROM tasks WHERE task_id = ? AND status = 'Pending'";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, taskId);

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }

    }
}
