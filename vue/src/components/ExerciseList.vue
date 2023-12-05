<template>
  <div>
    <h2>Your total visit time is: ({{ totalVisitDuration }})</h2>
    <h2>Exercise List</h2>
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
</template>

<script>
import ExerciseService from "../services/ExerciseService";

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
    this.getTotalVisitDurationByUserId();
  },
  methods: {
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