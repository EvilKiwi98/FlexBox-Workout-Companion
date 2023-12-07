<template>
  <div class="home">
    <h1>Home</h1>
    <p class="subtitle">You must be authenticated to see this</p>
    <div class="content">
      <div class="check-in-out-container dashboard-container">
        <check-in-out class="dashboard-section" />
      </div>
      <div class="exercise-log-container dashboard-container">
        <exercise-log class="dashboard-section" />
      </div>
    </div>
  </div>
</template>

<script>
import CheckInOut from '../components/CheckInOut.vue';
import ExerciseLog from '../components/ExerciseLog.vue'
export default {
  components: {
    CheckInOut,
    ExerciseLog
  },
  methods: {
    setCheckInOutTime() {
    }
  }
};
</script>

<style scoped>
.home {
  text-align: center;
  margin: 50px 0;
  padding: 30px;
  width: 100vw;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  position: relative;
}

.home:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 50%;
  background-color: #eec0a0;
  z-index: -1; /* Set a lower z-index to place it behind content */
}

h1,
.subtitle {
  color: #000000;
  z-index: 1; /* Set a higher z-index to place it in front of the background */
}

.content {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
  z-index: 1;
}

.dashboard-container {
  flex-grow: 1;
  margin: 0 10px;
  position: relative;
  z-index: 2; /* Set a higher z-index to place it in front of the background */
}

.dashboard-section {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

.dashboard-section h2 {
  color: #3498db;
  font-size: 24px;
  margin-bottom: 15px;
}
</style>