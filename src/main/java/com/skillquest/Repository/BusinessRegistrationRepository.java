package com.skillquest.Repository;

import com.skillquest.Entity.Business;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BusinessRegistrationRepository extends DBConnection {

    public static boolean isSuccessfullyExcuted = false;

    public void saveBusiness(Business business){
        String query = "INSERT INTO users(name, email, university_businessName, major_businessType, phone, location, password, role, status, registredDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, business.getContactName());
            ps.setString(2, business.getEmail());
            ps.setString(3, business.getBusinessName());
            ps.setString(4, business.getBusinesstype());
            ps.setString(5,String.valueOf(business.getPhone()));
            ps.setString(6, business.getLocation());
            ps.setString(7, business.getPassword());
            ps.setString(8, business.getRole());
            ps.setString(9, business.getStatus());
            ps.setString(10, business.getRegistredDate());

            System.out.println("helllo");
            //excute query
            ps.executeUpdate();
            isSuccessfullyExcuted = true;
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public List<Business> getAllBusiness(){

        String query = "SELECT id, name, email, university_businessName, major_businessType, phone, location, status, registredDate FROM users";

        List<Business> businessesList = new ArrayList<>();

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
//            ps.setString(1, role);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Business business = new Business();
                business.setBusinessId(rs.getInt("id"));
                business.setContactName(rs.getString("name"));
                business.setEmail(rs.getString("email"));
                business.setBusinessName(rs.getString("university_businessName"));
                business.setBusinesstype(rs.getString("major_businessType"));
                business.setPhone(rs.getString("phone"));
                business.setLocation(rs.getString("location"));
                business.setStatus(rs.getString("status"));
                business.setRegistredDate(rs.getString("registredDate"));

                //Adding to the List
                businessesList.add(business);
            }

            isSuccessfullyExcuted = true;
        } catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }

    public void deleteStudent(){

        String query = "DELETE * FORM users WHERE role = ?";

        try(Connection con = getConnection();
            PreparedStatement ps =  con.prepareStatement(query)){
            ps.setString(1, "business");

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
