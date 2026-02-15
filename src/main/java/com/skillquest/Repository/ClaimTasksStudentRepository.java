package com.skillquest.Repository;

import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClaimTasksStudentRepository extends DBConnection {

    public void claimTaskById(int studentId, int taskId){
        String query = "UPDATE tasks SET student_id = ?, status = 'Claimed' WHERE task_id = ?";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setInt(1, studentId);
            ps.setInt(2, taskId);

            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }

    }

    public List<TasksDTOs> getAllStudentClaimTasks(int studentId){

        String query = "SELECT t.task_id, t.location, t.student_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.progression, t.budget, t.deadline " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE (t.status = 'Claimed' OR t.progression = 'CheckingAdmin') AND t.student_id = ?";

        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //check if its student or business
                TasksDTOs tasks = new TasksDTOs();
                tasks.setId(rs.getInt("task_id"));
                tasks.setBusiness_id(rs.getInt("business_id"));
                tasks.setStudent_id(rs.getInt("student_id"));
                tasks.setBusinessName(rs.getString("university_businessName"));
                tasks.setTitle(rs.getString("title"));
                tasks.setDescription(rs.getString("description"));
                tasks.setLocation(rs.getString("location"));
                tasks.setTask_type(rs.getString("task_type"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));
                tasks.setProgression(rs.getString("progression"));

                System.out.println("all Task claim by "+studentId);
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllAvailableTasks(){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.budget, t.deadline, t.location " +
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
                tasks.setDeadline(rs.getString("deadline"));
                tasks.setLocation(rs.getString("location"));

                System.out.println("all available task form claim student controller");
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public UserInfoDTOs getUserInfo(int studentId){

        UserInfoDTOs userInfoDTOs = new UserInfoDTOs();

        String query = "SELECT id, name, university_businessName, major_businessType, role, email, phone, location FROM users WHERE id = ?";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userInfoDTOs.setId(rs.getInt("id"));
                userInfoDTOs.setName(rs.getString("name"));
                userInfoDTOs.setBusinessName(rs.getString("university_businessName"));
                userInfoDTOs.setRole(rs.getString("role"));
                userInfoDTOs.setMajor_businessType(rs.getString("major_businessType"));
                userInfoDTOs.setEmail(rs.getString("email"));
                userInfoDTOs.setLocation(rs.getString("location"));
                userInfoDTOs.setPhone(rs.getString("phone"));

                //for first letter
                String role = rs.getString("role");

                if(role.equals("student")){
                    userInfoDTOs.setFirstLetter(rs.getString("name").toUpperCase().substring(0,1));
                }
                else{
                    userInfoDTOs.setFirstLetter(rs.getString("university_businessName").toUpperCase().substring(0,1));
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return userInfoDTOs;
    }
}
