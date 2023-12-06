<template>
  <div class="container">
    <div class="exercise-list-container">
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
          <span class="exercise-date">Date: {{ formatDate(exercise.date) }}</span>
        </li>
      </ul>
    </div>

    <!-- Total Visit Time Container -->
    <div class="visit-info">
      <h2>Your total visit time:</h2>
      <p class="total-time">
        {{ formatDuration(totalVisitDuration) }} ({{ totalVisitDuration }} minutes)
      </p>
    </div>
  </div>
</template>

<script>
import ExerciseService from "../services/ExerciseService";

export default {
  data() {
    return {
      totalVisitDuration: 0,
      exercises: [],
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
    formatDuration(minutes) {
      const days = Math.floor(minutes / 1440);
      const hours = Math.floor((minutes % 1440) / 60);
      const remainingMinutes = minutes % 60;

      return `${days}d ${hours}h ${remainingMinutes}m`;
    },
    getExerciseByDayByUserId(date) {
      this.isLoading = true;
      ExerciseService.getExerciseByDayByUserId(this.$store.getters.getUserId, date).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },
    getExerciseBySelectedDate() {
      const selectedDate = this.exercise.date;
      if (selectedDate) {
        this.getExerciseByDayByUserId(selectedDate);
      } else {
        console.warn("Please select a date.");
      }
    },
  },
};
</script>

<style scoped>
.container {
  display: flex; /* Use flexbox to position items */
  max-width: 1200px; /* Set max-width for better responsiveness */
  margin: 20px auto; /* Center the content */
}

.visit-info {
  width: 25%; /* Adjust width as needed (1/4 of the container) */
  padding: 15px;
  margin-left: auto; /* Add left margin to push it to the right */
  background-color: #3498db;
  color: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  text-align: center;
  overflow: hidden; /* Hide overflow content */
}

.total-time {
  font-size: 20px;
  margin-top: 10px;
}

.exercise-list-container {
  width: 70%; /* Adjust width as needed (3/4 of the container) */
}

.exercise-list {
  list-style: none;
  padding: 0;
}

.exercise-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.exercise-item:hover {
  transform: scale(1.02);
}

.exercise-name {
  font-size: 20px;
  font-weight: bold;
  color: #333;
}

.exercise-sets,
.exercise-reps,
.exercise-duration,
.exercise-weight,
.exercise-date {
  display: block;
  margin-top: 8px;
  font-size: 14px;
  color: #555;
}

.exercise-reps,
.exercise-duration {
  font-style: italic;
}

.exercise-date {
  color: #777;
}
</style>