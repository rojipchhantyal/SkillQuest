package com.skillquest.Repository;

import com.skillquest.Entity.Student;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRegistrationRepository extends DBConnection {

    public static boolean isSuccessfullyExcuted = false;

    public void saveStudent(Student student){
        String query = "INSERT INTO users(name, email, university_businessName, major_businessType, phone, location, password, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, student.getFullName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getUniversityName());
            ps.setString(4, student.getMajor());
            ps.setString(5,String.valueOf( student.getPhone()));
            ps.setString(6, student.getLocation());
            ps.setString(7, student.getPassword());
            ps.setString(8, student.getRole());
            ps.setString(9, student.getStatus());

            //excute query
            ps.executeUpdate();
            isSuccessfullyExcuted = true;
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudent(){

        String query = "SELECT id, name, email, university_businessName, major_businessType, phone, location, status FROM users";

        List<Student> studentList = new ArrayList<>();

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
//            ps.setString(1, role);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Student student = new Student();
                student.setStudentId(rs.getInt("id"));
                student.setFullName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setUniversityName(rs.getString("university_businessName"));
                student.setMajor(rs.getString("major_businessType"));
                student.setPhone(rs.getString("phone"));
                student.setLocation(rs.getString("location"));
                student.setStatus(rs.getString("status"));

                //Adding to the List
                studentList.add(student);
            }

            isSuccessfullyExcuted = true;
        } catch (SQLException e){
            e.printStackTrace();
        }

        return null;
    }

    public void deleteAllStudent(){

        String query = "DELETE * FORM users WHERE role = ?";

        try(Connection con = getConnection();
        PreparedStatement ps =  con.prepareStatement(query)){
            ps.setString(1, "student");

        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
