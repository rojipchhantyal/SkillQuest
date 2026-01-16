package com.skillquest.DTOs;

public class TotalCounterDTOs {
    private long TotalPendingUserRegistration ;
    private long TotalPendingTasks ;
    private long TotalUsers ;
    private long TotalTasks ;

    private long taskCompleted;
    private long totalEarning;
    private long totalClaimedTasks;

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
}
