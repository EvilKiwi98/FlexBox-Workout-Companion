<template>
    <div class="exercise-buttons">
      <button
        v-for="exerciseOption in exerciseOptions"
        :key="exerciseOption.id"
        @click="selectExercise(exerciseOption)"
      >
        <img
          :src="`../assets/${exerciseOption.name.replace(/\s+/g, '-').toLowerCase()}.png`"
          alt="Exercise Image"
          class="button-icon"
        />
        {{ exerciseOption.name }}
      </button>
    </div>
  </template>
  
  <script>
  export default {
    props: ['selectExercise'],
    data() {
      return {
        exerciseOptions: [
          { id: 1, name: "Bench Press", mode: "reps" },
          // ... (Other exercise options)
        ],
      };
    },
  };
  </script>
  
  <style scoped>
  /* Style the button container and icon as needed */
  .exercise-buttons {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .button-icon {
    width: auto; /* Let the width adjust automatically */
    height: 60px; /* Set a fixed height */
    margin-right: 10px;
  }
  </style>