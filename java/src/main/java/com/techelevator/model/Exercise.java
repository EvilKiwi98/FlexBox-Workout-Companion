package com.techelevator.model;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Exercise {

    private String exerciseName;
    private int userId;
    private int exerciseId;
    private int reps;
    private double weight;
    private LocalDate date;
    private int durationInMinutes;

    public Exercise(String exerciseName, int userId, int exerciseId, int reps, double weight, LocalDate date, int durationInMinutes) {
        this.exerciseName = exerciseName;
        this.userId = userId;
        this.exerciseId = exerciseId;
        this.reps = reps;
        this.weight = weight;
        this.date = date;
        this.durationInMinutes = durationInMinutes;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Exercise() {
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getDurationInMinutes() {
        return durationInMinutes;
    }

    public void setDurationInMinutes(int durationInMinutes) {
        this.durationInMinutes = durationInMinutes;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }
}
