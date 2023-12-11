package com.techelevator.dao;

import com.techelevator.controller.CloudinaryService;
import com.techelevator.model.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import java.util.Base64;


@Component
public class JdbcProfileDao implements ProfileDao {
    private final JdbcTemplate jdbcTemplate;
    private final CloudinaryService cloudinaryService;

    public JdbcProfileDao(JdbcTemplate jdbcTemplate, CloudinaryService cloudinaryService) {
        this.jdbcTemplate = jdbcTemplate;
        this.cloudinaryService = cloudinaryService;

    }

    @Override
    public Profile getUserProfileByUserId(int userId) {
        Profile profile = new Profile();
        String sql = "SELECT users.user_id, username, profile_picture_url, email FROM users\n" +
                "JOIN profiles ON users.user_id = profiles.user_id\n" +
                "WHERE users.user_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        if (results.next()) {
            profile.setUsername(results.getString("username"));
            profile.setProfilePicUrl(results.getString("profile_picture_url"));
            profile.setEmailAddress(results.getString("email"));
        }
        return profile;
    }


    @Override
    public Profile createProfile(Profile profile) {
        // Extract base64 part from data URL
        String base64String = profile.getProfilePicUrl().split(",")[1];

        // Decode base64 string into a byte array
        byte[] imageBytes = Base64.getDecoder().decode(base64String);

        // Insert the profile into the database
        String sql = "INSERT into profiles (user_id, profile_picture_url, email) VALUES (?, ?, ?)";
        int profileId = jdbcTemplate.update(sql, profile.getUserId(), profile.getProfilePicUrl(), profile.getEmailAddress());

        profile.setProfileId(profileId);
        return profile;
    }
}



