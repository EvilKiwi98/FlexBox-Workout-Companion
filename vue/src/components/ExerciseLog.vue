<template>
    <div>
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
        <input type="number" id="sets" v-model="exercise.sets" required>
      </div>
      <div class="form-group">
        <label for="reps">Reps:</label>
        <input type="number" id="reps" v-model="exercise.reps" required>
      </div>
      <div class="form-group">
        <label for="duration">Duration:</label>
        <input type="number" id="duration" v-model="exercise.duration" required>
      </div>
      <div class="form-group">
        <label for="weight">Weight:</label>
        <input type="number" id="weight" v-model="exercise.weight" required>
      </div>
      <div class="form-group">
        <label for="date">Date:</label>
        <input type="date" id="date" v-model="exercise.date" required>
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
      exercise: {
        exerciseName: "",
        userId: "",
        exerciseId: "",
        sets: "",
        reps: "",
        duration: "",
        weight: "",
        date: "",
      },
      exerciseOptions: [
        { id: 1, name: 'Exercise 1' },
        { id: 2, name: 'Exercise 2' },
        { id: 3, name: 'Exercise 3' },
        ]
    };
  },
  methods: {
    submitExercise() {
      this.setUserId(),
        ExerciseService.addExercise(this.exercise).then((response) => {
          if (response.status === 200) {
            console.log(response.data);
          }
          this.exercise = {}
        });
    },
    setUserId() {
      this.exercise.userId = this.$store.getters.getUserId;
    },
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
</style>