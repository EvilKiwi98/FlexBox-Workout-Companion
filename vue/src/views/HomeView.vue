<template>
  <div class="home">
    <h1>Home</h1>
    <p class="subtitle">You must be authenticated to see this</p>
    

    <div class="content">
      <check-in-out class="dashboard-section" />
      <exercise-log class="dashboard-section" />
    </div>
  </div>
</template>
<script>
import CheckInOut from '../components/CheckInOut.vue';
import ExerciseLog from '../components/ExerciseLog.vue';

export default {
  components: {
    CheckInOut,
    ExerciseLog,
    
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
  margin: 50px auto;
  padding: 30px;
  max-width: 800px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  background-color: #f4f4f4;
}

h1 {
  color: #3498db;
  font-size: 32px;
  margin-bottom: 10px;
}

.subtitle {
  color: #555;
  font-size: 18px;
  margin-bottom: 20px;
}

.content {
  display: flex;
  justify-content: space-around;
  align-items: stretch;
  margin-top: 20px;
}

.dashboard-section {
  background-color: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
  flex-grow: 1;
  margin: 0 10px;
}

.dashboard-section h2 {
  color: #3498db;
  font-size: 24px;
  margin-bottom: 15px;
}
</style>