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

public class CompletedTaskRepository extends DBConnection {

    public void saveCompletedTasks(int taskId, TasksDTOs tasksDTOs){

        String query = "INSERT INTO completed_tasks (student_id, business_id, task_id, file_name, file_type, business_msg, github_link, submitted_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        String update = "UPDATE tasks SET progression = 'Completed' WHERE task_id = ?";

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
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(update)) {
            ps.setInt(1, taskId);

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

    public List<TasksDTOs> getAllStudentClaimTasks(int studentId){

        String query = "SELECT t.task_id, t.student_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.budget, t.deadline " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Claimed' AND t.student_id = ?";


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
                tasks.setTask_type(rs.getString("task_type"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                System.out.println("all Task claim by "+studentId);
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllAvailableTasks(){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.budget, t.deadline " +
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

        String query = "SELECT id, name, university_businessName, role FROM users WHERE id = ?";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userInfoDTOs.setId(rs.getInt("id"));
                userInfoDTOs.setName(rs.getString("name"));
                userInfoDTOs.setBusinessName(rs.getString("university_businessName"));
                userInfoDTOs.setRole(rs.getString("role"));
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return userInfoDTOs;
    }
}
