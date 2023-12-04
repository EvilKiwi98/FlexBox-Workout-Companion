package com.techelevator.controller;

import com.techelevator.dao.ExerciseDao;
import com.techelevator.model.Exercise;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class ExerciseController {

    private ExerciseDao exerciseDao;

    public ExerciseController(ExerciseDao exerciseDao){
        this.exerciseDao = exerciseDao;
    }
    @RequestMapping(path = "/exercise", method = RequestMethod.POST)
    public Exercise createExercise (@RequestBody Exercise newExercise){
        return exerciseDao.createExercise(newExercise);
    }
    @RequestMapping(path ="/exercise/{userId}", method = RequestMethod.GET)
    public List<Exercise> getExercisesByUserId (@PathVariable int userId){
        return exerciseDao.getExercisesByUserId(userId);
    }
}
