package com.techelevator.controller;
import com.techelevator.model.CheckInOut;
import com.techelevator.dao.CheckInOutDao;
import com.techelevator.model.Exercise;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class CheckInOutController {

    private CheckInOutDao checkInOutDao;

    public CheckInOutController(CheckInOutDao checkInOutDao) {
        this.checkInOutDao = checkInOutDao;
    }

    @RequestMapping(path = "/CheckIn", method = RequestMethod.POST)
    public CheckInOut checkIn(@RequestBody CheckInOut checkInTime) {
        return checkInOutDao.setCheckInTime(checkInTime);
    }
    @RequestMapping(path = "/CheckOut", method = RequestMethod.PUT)
    public void checkOut(@RequestBody CheckInOut checkOutTime) {
        checkInOutDao.setCheckOutTime(checkOutTime);
    }
    @RequestMapping(path = "/visits/duration/{userId}", method = RequestMethod.GET)
    public int fetchDurationByUserId (@PathVariable int userId){
        return checkInOutDao.getDurationTotalByUserId(userId);
    }
    @RequestMapping(path ="/visits/{userId}", method = RequestMethod.GET)
    public List<CheckInOut> getVisitsByUserId (@PathVariable int userId){
        return checkInOutDao.getVisitsByUserId(userId);
    }
    @RequestMapping(path = "/visits/{userId}/week", method = RequestMethod.GET)
    public List<CheckInOut> getPastWeekOfVisitsByUserId (@PathVariable int userId){
        return checkInOutDao.getPastWeekOfVisitsByUserId(userId);
    }
    @RequestMapping(path = "/visits/{userId}/{monthNum}", method = RequestMethod.GET)
    public List<CheckInOut> getSpecificMonthVisitsByUserId (@PathVariable int userId,@PathVariable int monthNum){
        return checkInOutDao.getSpecificMonthVisitsByUserId(userId, monthNum);
    }
}
