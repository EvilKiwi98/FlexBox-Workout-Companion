package com.techelevator.dao;

import com.techelevator.model.Profile;

public interface ProfileDao {


    Profile getUserProfileByUserId(int userId);

    Profile createProfile(Profile profile);
}