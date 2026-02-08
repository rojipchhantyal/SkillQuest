package com.skillquest.DTOs;

public class TotalCounterDTOs {

    //for admin total counter
    private long TotalPendingUserRegistration ;
    private long TotalPendingTasks ;
    private long TotalUsers ;
    private long TotalTasks ;

    //for student total counter
    private long taskCompleted;
    private long totalEarning;
    private long totalClaimedTasks;

    //for business total counter
    private long allBusinessTasks;
    private long allBusinessPendingTasks;
    private long allBusinessApprovedTasks;
    private long allBusinessCompletedTasks;

    //for both student and business
    private int fund;

    public long getTotalPendingUserRegistration() {
        return TotalPendingUserRegistration;
    }

    public void setTotalPendingUserRegistration(long totalPendingUserRegistration) {
        TotalPendingUserRegistration = totalPendingUserRegistration;
    }

    public long getTotalPendingTasks() {
        return TotalPendingTasks;
    }

    public void setTotalPendingTasks(long totalPendingTasks) {
        TotalPendingTasks = totalPendingTasks;
    }

    public long getTotalUsers() {
        return TotalUsers;
    }

    public void setTotalUsers(long totalUsers) {
        TotalUsers = totalUsers;
    }

    public long getTotalTasks() {
        return TotalTasks;
    }

    public void setTotalTasks(long totalTasks) {
        TotalTasks = totalTasks;
    }

    public long getTaskCompleted() {
        return taskCompleted;
    }

    public void setTaskCompleted(long taskCompleted) {
        this.taskCompleted = taskCompleted;
    }

    public long getTotalEarning() {
        return totalEarning;
    }

    public void setTotalEarning(long totalEarning) {
        this.totalEarning = totalEarning;
    }

    public long getTotalClaimedTasks() {
        return totalClaimedTasks;
    }

    public void setTotalClaimedTasks(long totalClaimedTasks) {
        this.totalClaimedTasks = totalClaimedTasks;
    }

    public long getAllBusinessTasks() {
        return allBusinessTasks;
    }

    public void setAllBusinessTasks(long allBusinessTasks) {
        this.allBusinessTasks = allBusinessTasks;
    }

    public long getAllBusinessPendingTasks() {
        return allBusinessPendingTasks;
    }

    public void setAllBusinessPendingTasks(long allBusinessPendingTasks) {
        this.allBusinessPendingTasks = allBusinessPendingTasks;
    }

    public long getAllBusinessApprovedTasks() {
        return allBusinessApprovedTasks;
    }

    public void setAllBusinessApprovedTasks(long allBusinessApprovedTasks) {
        this.allBusinessApprovedTasks = allBusinessApprovedTasks;
    }

    public long getAllBusinessCompletedTasks() {
        return allBusinessCompletedTasks;
    }

    public void setAllBusinessCompletedTasks(long allBusinessCompletedTasks) {
        this.allBusinessCompletedTasks = allBusinessCompletedTasks;
    }

    public int getFund() {
        return fund;
    }

    public void setFund(int fund) {
        this.fund = fund;
    }
}
