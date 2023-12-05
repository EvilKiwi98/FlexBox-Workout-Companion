package com.techelevator.dao;

import com.techelevator.model.CheckInOut;

public interface CheckInOutDao {


    public CheckInOut setCheckInTime(CheckInOut checkInTime);

    public boolean setCheckOutTime(CheckInOut checkOutTime);

    public int getDurationTotalByUserId(int userId);

}
