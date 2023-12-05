<template>
  <div>
    <div v-on:click="getTotalVisitDurationByUserId()">
      <p> Your total visit time is : {{ totalVisitDuration }}</p>
    </div>

    <btn v-on:click="showEmployeeForm = !showEmployeeForm"> Show Employee Search </btn>
    <div class="employeeSearch" v-show="showEmployeeForm">
      <label for="userIdInput"> Enter User Id: </label>
      <input type="number" id="userIdInput" v-model="userId" />
      <btn v-on:click="getExerciseByUserId(userId)"> Search </btn>
      <ul class="exercise-list">
        <li v-for="exercise in exercises" :key="exercise.exercise_id" class="exercise-item">
          <span class="exercise-name">{{ exercise.exerciseName }}</span>
          <span class="exercise-sets">Sets: {{ exercise.sets }}</span>
          <span v-show="exercise.mode === 'reps'" class="exercise-reps">Reps: {{ exercise.reps }}</span>
          <span v-show="exercise.mode === 'duration'" class="exercise-duration">Duration: {{ exercise.duration }}
            mins</span>
          <span class="exercise-weight">Weight: {{ exercise.weight }} lbs</span>
          <span class="exercise-date">Date: {{ exercise.date }}</span>
        </li>
      </ul>
    </div>


    <h1>Please log your exercise</h1>
    <form class="exerciseForm" v-on:submit.prevent="submitExercise">
      <div class="form-group">
        <label for="exerciseName">Exercise Name:</label>
        <select id="exerciseName" v-model="exercise.exerciseName" required>
          <option v-for="exerciseOption in exerciseOptions" :key="exerciseOption.id" :value="exerciseOption.name">
            {{ exerciseOption.name }}
          </option>
        </select>
      </div>


      <div class="form-group">
        <label for="sets">Sets:</label>
        <input type="number" id="sets" v-model="exercise.sets" required />
      </div>
      <div class="form-group">
        <label>Choose one:</label>
        <div>
          <label>
            <input type="radio" v-model="exercise.mode" value="reps" /> Reps
          </label>
          <label>
            <input type="radio" v-model="exercise.mode" value="duration" />
            Duration (minutes)
          </label>
        </div>
      </div>
      <div class="form-group" v-if="exercise.mode == 'reps'">
        <label for="reps">Reps:</label>
        <input type="number" id="reps" v-model="exercise.reps" required />
      </div>
      <div class="form-group" v-if="exercise.mode == 'duration'">
        <label for="duration">Duration (minutes):</label>
        <input type="number" id="duration" v-model="exercise.duration" required />
      </div>
      <div class="form-group" v-if="exercise.mode == 'reps'">
        <label for="weight">Weight:</label>
        <input type="number" id="weight" v-model="exercise.weight" required />

      </div>
      <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" v-model="exercise.date" required />
      </div>
      <button type="submit">Submit</button>
    </form>


  </div>

  <div>
    <h2>Exercise List</h2>
    <ul class="exercise-list">
      <li v-for="exercise in exercises" :key="exercise.exercise_id" class="exercise-item">
        <span class="exercise-name">{{ exercise.exerciseName }}</span>
        <span class="exercise-sets">Sets: {{ exercise.sets }}</span>
        <span v-show="exercise.mode === 'reps'" class="exercise-reps">Reps: {{ exercise.reps }}</span>
        <span v-show="exercise.mode === 'duration'" class="exercise-duration">Duration: {{ exercise.duration }}
          mins</span>
        <span class="exercise-weight">Weight: {{ exercise.weight }} lbs</span>
        <span class="exercise-date">Date: {{ exercise.date }}</span>
      </li>
    </ul>
  </div>
</template>
<script>
import ExerciseService from "../services/ExerciseService.js";

export default {
  data() {
    return {
      totalVisitDuration: "",
      exercises: [],
      showEmployeeForm: false,
      userId: "",
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
      ExerciseService.getExerciseByUserId(this.$store.getters.getUserId).then((response) => {
        this.isLoading = false;
        this.exercises = response.data;
      });
    },
    formatDate(date) {
      const options = { year: 'numeric', month: 'short', day: 'numeric' };
      return new Date(date).toLocaleDateString('en-US', options);
    },
    getTotalVisitDurationByUserId() {
      ExerciseService.getTotalVisitDurationByUserId(this.$store.getters.getUserId)
        .then(response => {
          if (response.status === 200) {
            this.totalVisitDuration = response.data
          }
        })
    }
  },
};
</script>

<style scoped>
.exercise-form {
  max-width: 400px;
  margin: auto;
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
}
</style>]
