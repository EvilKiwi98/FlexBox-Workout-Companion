package com.techelevator.dao;

import com.techelevator.model.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcProfileDao implements ProfileDao {
    private final JdbcTemplate jdbcTemplate;

    public JdbcProfileDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
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
            String sql = "INSERT into profiles (user_id, profile_picture_url, email) VALUES (1, 'C:\\Users\\Student\\Pictures\\Gym Icons', 'test@gmail.com')";
            int profileId = jdbcTemplate.queryForObject(sql, int.class, profile.getUserId(), profile.getUsername(), profile.getProfilePicUrl(), profile.getEmailAddress());
            profile.setProfileId(profileId);
            return profile;
        }
    }



