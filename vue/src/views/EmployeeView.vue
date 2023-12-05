<template>
  <div>
    <btn v-on:click="showEmployeeForm = !showEmployeeForm">
      Show Employee Search
    </btn>

    <div class="employeeSearch" v-show="showEmployeeForm">
      <label for="userIdInput"> Enter User Id: </label>
      <input type="number" id="userIdInput" v-model="userId" />
      <btn v-on:click="employeeGetExerciseByUserId(userId)"> Search </btn>

      <ul class="exercise-list">
        <li
          v-for="exercise in exercises"
          :key="exercise.exercise_id"
          class="exercise-item"
        >
          <span class="exercise-name">{{ exercise.exerciseName }}</span>
          <span class="exercise-sets">Sets: {{ exercise.sets }}</span>
          <span v-show="exercise.mode === 'reps'" class="exercise-reps"
            >Reps: {{ exercise.reps }}</span
          >
          <span v-show="exercise.mode === 'duration'" class="exercise-duration"
            >Duration: {{ exercise.duration }} mins</span
          >
          <span class="exercise-weight">Weight: {{ exercise.weight }} lbs</span>
          <span class="exercise-date">Date: {{ exercise.date }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>

import ExerciseService from '../services/ExerciseService';

export default {
  data() {
    return {
      totalVisitDuration: "",
      exercises: [],
      showEmployeeForm: false,
      userId: null,
      exercise: {
        exerciseName: "",
        userId: "",
        exerciseId: "",
        sets: "",
        reps: "",
        duration: "",
        weight: "",
        date: "",
        mode: "", // Added property for reps or duration choice
      },
      exerciseOptions: [
        { id: 1, name: "Bench press", mode: "reps" },
        { id: 2, name: "Treadmill", mode: "duration" },
        { id: 3, name: "Exercise 3" },
      ],
    };
  },
  mounted() {
    this.getExerciseByUserId();
  },
  methods: {
    submitExercise() {
      this.setUserId();
      if (this.exercise.mode === "reps") {
        this.exercise.duration = null; // Reset duration if reps mode is selected
      } else if (this.exercise.mode === "duration") {
        this.exercise.reps = null; // Reset reps if duration mode is selected
      }
      ExerciseService.addExercise(this.exercise).then((response) => {
        if (response.status === 200) {
          console.log(response.data);
        }
        this.exercise = {};
      });
    },
    setUserId() {
      this.exercise.userId = this.$store.getters.getUserId;
    },
    getExerciseByUserId() {
      ExerciseService.getExerciseByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.isLoading = false;
          this.exercises = response.data;
        }
      );
    },

    employeeGetExerciseByUserId(userId) {
      ExerciseService.getExerciseByUserId(userId).then((response) => {
        this.isLoading = false;
        this.exercises = response.data;
      });
    },

    formatDate(date) {
      const options = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-US", options);
    },
    getTotalVisitDurationByUserId() {
      ExerciseService.getTotalVisitDurationByUserId(
        this.$store.getters.getUserId
      ).then((response) => {
        if (response.status === 200) {
          this.totalVisitDuration = response.data;
        }
      });
    },
  },
};
</script>

<style>
</style>