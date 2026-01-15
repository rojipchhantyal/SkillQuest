package com.skillquest.Repository;

import com.skillquest.DTOs.LoginDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.DTOs.TotalCounterDTOs;
import com.skillquest.DTOs.UserInfoDTOs;
import com.skillquest.Entity.Business;
import com.skillquest.Entity.Student;
import com.skillquest.Util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginRepository extends DBConnection {

    public static boolean isFound = false;

    public UserInfoDTOs findUser(LoginDTOs loginDTOs){
        String query = "SELECT id, name, university_businessName, role FROM users WHERE email = ? AND password = ? AND role = ? AND (status = 'approved' OR status = 'admin')";

        try(Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, loginDTOs.getEmail());
            ps.setString(2, loginDTOs.getPassword());
            ps.setString(3, loginDTOs.getRole());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("\n\nFound User\n\n");
                UserInfoDTOs userInfoDTOs = new UserInfoDTOs();
                userInfoDTOs.setId(rs.getInt("id"));
                userInfoDTOs.setName(rs.getString("name"));
                userInfoDTOs.setBusinessName(rs.getString("university_businessName"));
                userInfoDTOs.setRole(rs.getString("role"));

                isFound = true;
                return userInfoDTOs;
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        System.out.println("\n\nCant found user\n\n");
        isFound = false;
        return null;
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
                    student.setRegistredDate(rs.getString("registredDate"));

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
                    business.setRegistredDate(rs.getString("registredDate"));
                    System.out.println("adding business");

                    allPandingUsers.add(business);
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return allPandingUsers;
    }

    public List<Object> getAllUsers(){
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

    public List<TasksDTOs> getAllPendingTasks() {

        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Pending'";


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
                tasks.setLocation(rs.getString("location"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                System.out.println("\n\n\n\nPending tasks");
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllAvailableTasks(){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline " +
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
                tasks.setLocation(rs.getString("location"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                System.out.println("\n\n\n\nPending tasks");
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllClaimTasks(int studentId){

        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.budget, t.deadline " +
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

    public List<TasksDTOs> getAllBusinessPostedTask(int businessId){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline, t.status FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.business_id = ?";

        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, businessId);
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
                tasks.setLocation(rs.getString("location"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));
                tasks.setStatus(rs.getString("status"));

                System.out.println("business posted tasks"+businessId);
                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public TotalCounterDTOs getAllTotalInfo(){
        String query = "SELECT COUNT(*) AS totalPendingUserRegistration FROM users WHERE status = 'panding'";

        String query2 = "SELECT COUNT(*) AS totalPendingTasks FROM tasks WHERE status = 'Pending'";

        String query3 = "SELECT COUNT(*) AS totalUsers FROM users WHERE status = 'approved'";

        String query4 = "SELECT COUNT(*) AS totalTasks FROM tasks WHERE status IN ('Approved', 'Claimed', 'Completed')";

        TotalCounterDTOs totalCounterDTOs = new TotalCounterDTOs();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                totalCounterDTOs.setTotalPendingUserRegistration(rs.getLong("totalPendingUserRegistration"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query2)) {

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setTotalPendingTasks(rs.getLong("totalPendingTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query3)) {

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setTotalUsers(rs.getLong("totalUsers"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query4)) {

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setTotalTasks(rs.getLong("totalTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return totalCounterDTOs;
    }
}
