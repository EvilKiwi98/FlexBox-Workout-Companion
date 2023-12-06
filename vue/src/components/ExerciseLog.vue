<template>
  <div>
    <div v-on:click="getTotalVisitDurationByUserId()">
      <p>Your total visit time is: {{ totalVisitDuration }} minutes</p>
    </div>

    <h1>Log Your Exercise</h1>
    <form class="exercise-form" v-on:submit.prevent="submitExercise">
      <div class="form-group">
        <label for="exerciseName">Exercise Name</label>
        <select id="exerciseName" v-model="exercise.exerciseName" required>
          <option
            v-for="exerciseOption in exerciseOptions"
            :key="exerciseOption.id"
            :value="exerciseOption.name"
          >
            {{ exerciseOption.name }}
          </option>
        </select>
      </div>

      <div class="form-group">
        <label for="sets">Sets</label>
        <input type="number" id="sets" v-model="exercise.sets" required />
      </div>

      <div class="form-group">
        <label>Choose one</label>
        <div class="radio-group">
          <label>
            <input type="radio" v-model="exercise.mode" value="reps" /> Reps
          </label>
          <label>
            <input type="radio" v-model="exercise.mode" value="duration" />
            Duration (minutes)
          </label>
        </div>
      </div>

      <div v-if="exercise.mode === 'reps'">
        <div class="form-group">
          <label for="reps">Reps</label>
          <input type="number" id="reps" v-model="exercise.reps" required />
        </div>
        <div class="form-group">
          <label for="weight">Weight</label>
          <input type="number" id="weight" v-model="exercise.weight" required />
        </div>
      </div>

      <div v-if="exercise.mode === 'duration'">
        <div class="form-group">
          <label for="duration">Duration (minutes)</label>
          <input type="number" id="duration" v-model="exercise.duration" required />
        </div>
      </div>

      <div class="form-group">
        <label for="date">Date</label>
        <input type="date" id="date" v-model="exercise.date" required />
      </div>

      <button type="submit">Submit</button>
    </form>
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

<style scoped>
.exercise-form {
  max-width: 400px;
  margin: auto;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 15px;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

input,
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.radio-group {
  display: flex;
  gap: 10px;
}

button {
  background-color: #4285f4;
  color: #fff;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #0052cc;
}
</style>