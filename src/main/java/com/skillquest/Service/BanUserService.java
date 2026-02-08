package com.skillquest.Service;

import com.skillquest.Repository.BanUserRepository;

public class BanUserService {

    BanUserRepository banUserRepository = new BanUserRepository();

    public void banUserById(int userId){

        banUserRepository.banUserById(userId);
    }
}
