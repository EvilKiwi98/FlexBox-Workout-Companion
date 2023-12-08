<!-- ExerciseButtons.vue -->
<template>
  <div class="exercise-buttons">
    <button class="exercise-button"
      v-for="exerciseOption in exerciseOptions"
      :key="exerciseOption.id"
      @click="selectExercise(exerciseOption)"
    >
      <!-- Adjust the image source path to match your actual file names -->
      <img
      :src="`/assets/${exerciseOption.name.toLowerCase().replace(/\s+/g, '')}.png`"
        alt="Exercise Image"
        class="button-icon"
      />
      {{ exerciseOption.name }}
    </button>
  </div>
</template>

<script>
export default {
  props: ['mode', 'selectExercise', 'playVideo'],
  data() {
    return {
      exerciseOptions: [
        { id: 1, name: "Bench Press", mode: "reps" },
        { id: 2, name: "Treadmill", mode: "duration" },
        { id: 3, name: "Dumbells", mode: "reps" },
        { id: 4, name: "Lat Pulldown", mode: "reps" },
        { id: 5, name: "Rowing Machine", mode: "duration" },
        { id: 6, name: "Stairmaster", mode: "duration" },
        { id: 7, name: "Squats", mode: "reps" },
        { id: 8, name: "Russian Twist", mode: "duration" },
        { id: 9, name: "Leg Extension Machine", mode: "reps" },
        { id: 10, name: "Fly", mode: "reps" },
        { id: 11, name: "Dips", mode: "reps" },
        { id: 12, name: "Abdominal Crunch", mode: "reps" },
        { id: 13, name: "Elliptical", mode: "duration" },
        { id: 14, name: "Deadlift", mode: "reps" },
        { id: 15, name: "Planks", mode: "duration" },
        { id: 16, name: "Assault Bike", mode: "duration" },
        { id: 17, name: "Push Ups", mode: "reps" },
        { id: 18, name: "Pulley", mode: "reps" },
      ],
    };
  },
  methods: {
    handleButtonClick(exerciseOption) {
      if (this.mode === 'select') {
        this.selectExercise(exerciseOption);
      } else if (this.mode === 'play') {
        this.playVideo(exerciseOption.videoId, exerciseOption.name);
      }
    },
  },
};
</script>

<style scoped>
/* Add styles if needed */

  .exercise-buttons {
    display: flex;
    justify-content: space-between;  /* Adjust this based on your layout preference */
    flex-wrap: wrap;
    margin-bottom: 20px;
  }

  .exercise-button {
    font-family: 'Exo 2', sans-serif;
    background-color: #3498db;
    color: #fff;
    padding: 10px 15px;
    margin: 0 10px 10px 0;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  }

  .exercise-button:hover {
    background-color: #2980b9;
  }
</style>

