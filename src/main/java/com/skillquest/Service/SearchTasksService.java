package com.skillquest.Service;

import com.skillquest.DTOs.SearchKeywordDTOs;
import com.skillquest.DTOs.TasksDTOs;
import com.skillquest.Repository.SearchTasksRepository;

import java.util.List;

public class SearchTasksService {

    SearchTasksRepository searchTasksRepository = new SearchTasksRepository();

    public List<TasksDTOs> searchTask(SearchKeywordDTOs searchKeywordDTOs){

        return searchTasksRepository.searchTask(searchKeywordDTOs);
    }

    public int getCountTask(SearchKeywordDTOs searchKeywordDTOs){

        return searchTasksRepository.getCountTask(searchKeywordDTOs);
    }
}
