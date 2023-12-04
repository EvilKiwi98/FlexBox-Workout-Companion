package com.techelevator.dao;
import com.techelevator.model.CheckInOut;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDateTime;

public class JdbcCheckInOutDaoTests extends BaseDaoTests {

    private JdbcCheckInOutDao sut;

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcCheckInOutDao(jdbcTemplate);
    }

    @Test
    public void setCheckInTimeReturnsCorrectTime(){
        CheckInOut checkInOutTest = new CheckInOut();
        LocalDateTime timeTest = LocalDateTime.now();
        checkInOutTest.setUserId(1);
        checkInOutTest.setCheckInTime(timeTest);
        sut.setCheckInTime(checkInOutTest);
        Assert.assertEquals(timeTest,checkInOutTest.getCheckInTime());
    }
    @Test
    public void setCheckOutTimeReturnsCorrectTime(){
        CheckInOut checkInOutTest = new CheckInOut();
        LocalDateTime timeTest = LocalDateTime.now();
        checkInOutTest.setUserVisitId(1);
        checkInOutTest.setUserId(1);
        checkInOutTest.setCheckOutTime(timeTest);
        sut.setCheckOutTime(checkInOutTest);
        Assert.assertEquals(timeTest,checkInOutTest.getCheckOutTime());
    }
}
