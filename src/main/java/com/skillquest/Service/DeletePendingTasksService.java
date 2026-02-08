package com.skillquest.Service;

import com.skillquest.Repository.DeletePendingTasksRepository;

public class DeletePendingTasksService {

    DeletePendingTasksRepository deletePendingTasksRepository = new DeletePendingTasksRepository();

    public void deletePendingTaskById(int taskId){

        deletePendingTasksRepository.deletePendingTaskById(taskId);
    }

}
