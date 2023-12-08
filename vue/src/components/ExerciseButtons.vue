<!-- ExerciseButtons.vue -->
<template>
  <div class="exercise-buttons">
    <button
      v-for="exerciseOption in exerciseOptions"
      :key="exerciseOption.id"
      @click="handleButtonClick(exerciseOption)"
    >
      <img
        :src="`../assets/${exerciseOption.name.replace(/\s+/g, '-').toLowerCase()}.png`"
        alt="Exercise Image"
        class="button-icon"
      />
      {{ mode === 'select' ? exerciseOption.name : 'Play ' + exerciseOption.name }}
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
        { id: 9, name: "Leg Press Machine", mode: "reps" },
        { id: 10, name: "Fly", mode: "reps" },
        { id: 11, name: "Dips", mode: "reps" },
        { id: 12, name: "Abdominal Crunch", mode: "reps" },
        { id: 13, name: "Elliptical Machine", mode: "duration" },
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
  flex-wrap: wrap;
  justify-content: center;
}

.button-icon {
  width: auto;
  height: 60px;
  margin-right: 10px;
}
</style>
