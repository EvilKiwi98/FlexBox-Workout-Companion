package com.techelevator.controller;

import com.techelevator.dao.ProfileDao;
import com.techelevator.model.Profile;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
public class ProfileController {

    private ProfileDao profileDao;

    public ProfileController(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }
@RequestMapping(path = "/profile/{userId}", method = RequestMethod.GET)
    public Profile getUserProfileByUserId(@PathVariable int userId) {
        return profileDao.getUserProfileByUserId(userId);
    }
@RequestMapping(path = "/profile/createProfile", method = RequestMethod.POST)
    public Profile createProfile(@RequestBody Profile profile) {
        return profileDao.createProfile(profile);
    }
}
