package com.techelevator.dao;

import com.techelevator.model.Exercise;

import java.util.List;

public interface ExerciseDao {

    Exercise createExercise(Exercise exercise);

    List<Exercise> getExercisesByUserId(int userId);

    // public Exercise getEquipmentById();
}
