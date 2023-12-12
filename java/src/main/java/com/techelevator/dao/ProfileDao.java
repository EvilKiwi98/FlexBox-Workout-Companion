package com.techelevator.dao;

import com.techelevator.model.Profile;

public interface ProfileDao {


    Profile getUserProfileByUserId(int userId);

    Profile createProfile(Profile profile);
    void saveImage(int userId, byte[] imageBytes);
    byte[] getImageByUserId(int userId);
}