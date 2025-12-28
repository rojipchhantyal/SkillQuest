package com.skillquest.Service;

import com.skillquest.DTOs.RegisterStudentDTOs;
import com.skillquest.Entity.Student;
import com.skillquest.Repository.StudentRegistrationRepository;

public class StudentRegistrationService {

    StudentRegistrationRepository studentRegistrationRepository = new StudentRegistrationRepository();

    public void registerStudent(RegisterStudentDTOs registerStudentDTOs){

        Student student = new Student();

        student.setFullName(registerStudentDTOs.getFullName());
        student.setEmail(registerStudentDTOs.getEmail());
        student.setUniversityName(registerStudentDTOs.getUniversityName());
        student.setMajor(registerStudentDTOs.getMajor());
        student.setPhone(registerStudentDTOs.getPhone());
        student.setLocation(registerStudentDTOs.getLocation());
        student.setPassword(registerStudentDTOs.getPassword());
        student.setStatus(registerStudentDTOs.getStatus());

        studentRegistrationRepository.saveStudent(student);
    }
}
