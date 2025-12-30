package com.skillquest.Repository;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.Entity.Business;
import com.skillquest.Entity.Student;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ApproveRegistrationRepository extends DBConnection {

    public boolean approveUserById(int id){
        String query = "UPDATE users SET status = ? WHERE id = ?";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, "approved");
            ps.setInt(2, id);

            ps.executeUpdate();
            return true;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    public List<Object> getAllPendingUsers(){
        String query = "SELECT * FROM users WHERE status = 'panding'";
        List<Object> allPandingUsers = new ArrayList<>();

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ResultSet rs = ps.executeQuery();
            while (rs.next()){

                //check if its student or business
                if(rs.getString("role").equals("student")){
                    Student student = new Student();
                    student.setStudentId(rs.getInt("id"));
                    student.setFullName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setUniversityName(rs.getString("university_businessName"));
                    student.setMajor(rs.getString("major_businessType"));
                    student.setPhone(rs.getString("phone"));
                    student.setLocation(rs.getString("location"));
                    student.setStatus(rs.getString("status"));

                    System.out.println("adding student");
                    allPandingUsers.add(student);
                }
                else{
                    Business business = new Business();
                    business.setBusinessId(rs.getInt("id"));
                    business.setContactName(rs.getString("name"));
                    business.setEmail(rs.getString("email"));
                    business.setBusinessName(rs.getString("university_businessName"));
                    business.setBusinesstype(rs.getString("major_businessType"));
                    business.setPhone(rs.getString("phone"));
                    business.setLocation(rs.getString("location"));
                    business.setStatus(rs.getString("status"));
                    System.out.println("adding business");

                    allPandingUsers.add(business);
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return allPandingUsers;
    }

    public List<Object> getAllusers(){
        String query = "SELECT * FROM users WHERE status = 'approved' AND  `role` <> 'admin'";

        List<Object> allUsers = new ArrayList<>();

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ResultSet rs = ps.executeQuery();
            while (rs.next()){

                //check if its student or business
                if(rs.getString("role").equals("student")){
                    Student student = new Student();
                    student.setStudentId(rs.getInt("id"));
                    student.setFullName(rs.getString("name"));
                    student.setEmail(rs.getString("email"));
                    student.setUniversityName(rs.getString("university_businessName"));
                    student.setMajor(rs.getString("major_businessType"));
                    student.setPhone(rs.getString("phone"));
                    student.setLocation(rs.getString("location"));
                    student.setStatus(rs.getString("status"));
                    student.setRegistredDate(rs.getString("registredDate"));

                    System.out.println("\n\n\n\nstudent with approved");
                    allUsers.add(student);
                }
                else{
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
                    System.out.println("\n\n\n\nbusiness with approved");

                    allUsers.add(business);
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return allUsers;
    }
}
