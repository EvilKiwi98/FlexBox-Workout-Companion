package com.techelevator.controller;
import com.techelevator.model.CheckInOut;
import com.techelevator.dao.CheckInOutDao;
import org.springframework.web.bind.annotation.*;

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
    @RequestMapping(path = "/visits/{userId}", method = RequestMethod.GET)
    public int fetchDurationByUserId (@PathVariable int userId){
        return checkInOutDao.getDurationTotalByUserId(userId);
    }
}
