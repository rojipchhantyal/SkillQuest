package com.skillquest.Repository;

import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BanUserRepository extends DBConnection {

    public void banUserById(int userId){

        System.out.println("\n\n\n\n\n user"+userId+"banned\n\n\n\n\n");
        String query = "UPDATE users SET status='Banned' WHERE id = ?";


        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, userId);

            ps.executeUpdate();

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
