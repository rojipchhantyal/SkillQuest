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
        String query = "SELECT id, name, university_businessName, major_businessType, role, email, phone, location FROM users WHERE email = ? AND password = ? AND role = ? AND (status = 'approved' OR status = 'admin')";

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

                    System.out.println(rs.getString("registredDate"));

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
                    System.out.println(rs.getString("registredDate"));
                    System.out.println("adding business");

                    allPandingUsers.add(business);
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }

        return allPandingUsers;
    }

    public List<TasksDTOs> getAllCompletionPendingTasks(){
        String query = "SELECT t.task_id, t.business_id, t.student_id, c.submitted_at, c.file_name, t.title, t.description, t.task_type, t.location, t.budget, t.deadline, t.status FROM tasks t JOIN completed_tasks c ON t.task_id = c.task_id WHERE t.status = 'Completed' AND progression = 'CheckingAdmin'";


        List<TasksDTOs> allCompletionPendingTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                TasksDTOs tasks = new TasksDTOs();
                tasks.setId(rs.getInt("task_id"));
                tasks.setBusiness_id(rs.getInt("business_id"));
                tasks.setStudent_id(rs.getInt("student_id"));
                tasks.setFileName(rs.getString("file_name"));
                tasks.setCompleteDate(rs.getString("submitted_at"));
                tasks.setTitle(rs.getString("title"));
                tasks.setDescription(rs.getString("description"));
                tasks.setTask_type(rs.getString("task_type"));
                tasks.setLocation(rs.getString("location"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                allCompletionPendingTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allCompletionPendingTasks;
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

                    student.getFullName();
                    student.getLocation();
                    student.getMajor();
                    student.getPhone();
                    student.getUniversityName();
                    student.getRole();
                    student.getRegistredDate();
                    student.getEmail();

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

        String query = "SELECT t.task_id, t.student_id, t.business_id, u.university_businessName, t.title, t.location, t.description, t.task_type, t.budget, t.deadline, t.progression " +
                "FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.student_id = ? AND (t.status = 'Claimed' OR t.progression = 'CheckingAdmin')";


        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //check if its student or business
                TasksDTOs tasks = new TasksDTOs();
                tasks.setId(rs.getInt("task_id"));
                tasks.setStudent_id(studentId);

                System.out.println(tasks.getStudent_id());

                tasks.setBusiness_id(rs.getInt("business_id"));
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

    public TotalCounterDTOs getAllStudentInfo(int studentId){
        String query = "SELECT COUNT(*) AS totalCompleteTasks FROM tasks WHERE student_id = ? AND status = 'Completed' AND progression = 'Completed'";

        String query2 = "SELECT COUNT(*) AS totalActiveTasks FROM tasks WHERE student_id = ? AND (status = 'Claimed' OR progression = 'CheckingAdmin')";

        String query3 = "SELECT fund FROM users WHERE id = ?";

        TotalCounterDTOs totalCounterDTOs = new TotalCounterDTOs();

        //for student completed tasks
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                totalCounterDTOs.setTaskCompleted(rs.getLong("totalCompleteTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        //for student claim tasks
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query2)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setTotalClaimedTasks(rs.getLong("totalActiveTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        //for student fund
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query3)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setFund(rs.getInt("fund"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalCounterDTOs;
    }

    public TotalCounterDTOs getAllBusinessInfo(int businessId){
        String query = "SELECT COUNT(*) AS totalBusinessTasks FROM tasks WHERE business_id = ?";

        //watch leter
        String query2 = "SELECT COUNT(*) AS totalBusinessApprovedTasks FROM tasks WHERE business_id = ? AND status = 'Approved'";

        String query3 = "SELECT COUNT(*) AS totalBusinessPendingTasks FROM tasks WHERE business_id = ? AND status = 'Pending'";

        String query4 = "SELECT COUNT(*) AS totalBusinessCompletedTasks FROM tasks WHERE business_id = ? AND status = 'Completed' AND progression = 'Completed'";

        String query5 = "SELECT fund FROM users WHERE id = ?";

        TotalCounterDTOs totalCounterDTOs = new TotalCounterDTOs();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, businessId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                totalCounterDTOs.setAllBusinessTasks(rs.getLong("totalBusinessTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query2)) {

            ps.setInt(1, businessId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setAllBusinessApprovedTasks(rs.getLong("totalBusinessApprovedTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query3)) {

            ps.setInt(1, businessId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setAllBusinessPendingTasks(rs.getLong("totalBusinessPendingTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query4)) {

            ps.setInt(1, businessId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setAllBusinessCompletedTasks(rs.getLong("totalBusinessCompletedTasks"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query5)) {

            ps.setInt(1, businessId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                totalCounterDTOs.setFund(rs.getInt("fund"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalCounterDTOs;
    }

    public List<TasksDTOs> getAllBusinessPendingTasks(int businessId){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline, t.status FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Pending' AND t.business_id = ?";


        List<TasksDTOs> allPendingTasks = new ArrayList<>();

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

                allPendingTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allPendingTasks;
    }

    public List<TasksDTOs> getAllBusinessActiveTasks(int businessId){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline, t.status FROM tasks t JOIN users u ON t.business_id = u.id WHERE (t.status = 'Claimed' OR t.progression = 'CheckingAdmin') AND t.business_id = ?";


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
                tasks.setLocation(rs.getString("location"));
                tasks.setTask_type(rs.getString("task_type"));
                tasks.setBudget(String.valueOf(rs.getFloat("budget")));
                tasks.setDeadline(rs.getString("deadline"));

                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllBusinessCompletedTasks(int businessId){
        String query = "SELECT t.task_id, t.business_id, u.university_businessName, "
                + "t.title, t.description, t.task_type, t.location, t.budget, "
                + "t.deadline, t.status, ct.file_name, ct.file_type, ct.business_msg, "
                + "ct.github_link, ct.submitted_at "
                + "FROM tasks t "
                + "JOIN users u ON t.business_id = u.id "
                + "JOIN completed_tasks ct ON t.task_id = ct.task_id "
                + "WHERE t.status = 'Completed' AND progression = 'Completed' AND t.business_id = ?";


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


                tasks.setFileName(rs.getString("file_name"));
                tasks.setFileType(rs.getString("file_type"));
                tasks.setBusinessMsg(rs.getString("business_msg"));
                tasks.setGithubLink(rs.getString("github_link"));
                tasks.setCompleteDate(rs.getString("submitted_at"));

                System.out.println(tasks.getCompleteDate());
                System.out.println(tasks.getGithubLink());
                System.out.println(tasks.getFileName());

                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }

    public List<TasksDTOs> getAllStudentCompletedTasks(int studentId){

        String query = "SELECT t.task_id, t.business_id, u.university_businessName, t.title, t.description, t.task_type, t.location, t.budget, t.deadline, t.status FROM tasks t JOIN users u ON t.business_id = u.id WHERE t.status = 'Completed' AND progression = 'Completed' AND t.student_id = ?";


        List<TasksDTOs> allTasks = new ArrayList<>();

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

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

                allTasks.add(tasks);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTasks;
    }
}
