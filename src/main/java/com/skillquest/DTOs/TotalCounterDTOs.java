package com.skillquest.DTOs;

public class TotalCounterDTOs {
    private long TotalPendingUserRegistration ;
    private long TotalPendingTasks ;
    private long TotalUsers ;
    private long TotalTasks ;

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
}
