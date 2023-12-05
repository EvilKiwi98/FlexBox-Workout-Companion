package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.CheckInOut;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.time.LocalDateTime;

@Component
public class JdbcCheckInOutDao implements CheckInOutDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcCheckInOutDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @ResponseStatus(HttpStatus.CREATED)
    @Override
    public CheckInOut setCheckInTime(CheckInOut checkInTime) {
        String sql = "INSERT INTO user_visits (user_id, check_in_date) VALUES (?,?) RETURNING user_visit_id;";
            int userVisitId = jdbcTemplate.queryForObject(sql, int.class, checkInTime.getUserId(), checkInTime.getCheckInTime());
        checkInTime.setUserVisitId(userVisitId);
        return checkInTime;
    }
    @Override
    public boolean setCheckOutTime(CheckInOut checkOutTime) {
        String sql = "UPDATE user_visits SET check_out_date = ?, duration = ? WHERE user_visit_id = ? ";
        boolean success = false;
        try{
       int numberOfRows = jdbcTemplate.update(sql, checkOutTime.getCheckOutTime(), checkOutTime.getDuration(), checkOutTime.getUserVisitId());
            if (numberOfRows == 0) {
                throw new DaoException("Zero rows affected, expected at least one");
            } else {
                success = true;
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return success;
    }

    @Override
    public int getDurationTotalByUserId(int userId) {
        int totalDuration = 0;
        String sql = "SELECT SUM(duration) FROM user_visits WHERE user_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, userId);
        if(result.next()){
            totalDuration = result.getInt("sum");
        }
        return totalDuration;
    }


}
