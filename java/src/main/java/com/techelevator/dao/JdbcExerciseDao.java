package com.techelevator.dao;

import com.techelevator.model.Exercise;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcExerciseDao implements ExerciseDao{
    private final JdbcTemplate jdbcTemplate;

    public JdbcExerciseDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Exercise createExercise(Exercise exercise) {
    String sql = "INSERT INTO exercise (user_id, exercise_name, date, duration) VALUES (?,?,?,?) RETURNING exercise_id;";
        int exerciseId = jdbcTemplate.queryForObject(sql, int.class, exercise.getUserId(), exercise.getExerciseName(), exercise.getDate(), exercise.getDurationInMinutes());
       exercise.setExerciseId(exerciseId);
        return exercise;
    }

    @Override
    public List<Exercise> getExercisesByUserId(int userId) {
        List <Exercise> exerciseList = new ArrayList<>();
        String sql = "SELECT exercise_id, exercise_name, user_id, date, duration FROM exercise WHERE user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while(results.next()){
            Exercise exercise = mapToRowSet(results);
            exerciseList.add(exercise);
        }
        return exerciseList;
    }

    public Exercise mapToRowSet(SqlRowSet results){
        Exercise exercise = new Exercise();
        exercise.setExerciseId(results.getInt("exercise_id"));
        exercise.setExerciseName(results.getString("exercise_name"));
        exercise.setUserId(results.getInt("user_id"));
        exercise.setDate(results.getDate("date").toLocalDate());
        exercise.setDurationInMinutes(results.getInt("duration"));
        return exercise;
    }
}
