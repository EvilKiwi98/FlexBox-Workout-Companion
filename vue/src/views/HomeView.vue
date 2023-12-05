<template>
  <div class="home">
    <h1>Home</h1>
    <p class="subtitle">You must be authenticated to see this</p>
    <div class="content">
    <check-in-out class="dashboard-section"/>
    <exercise-log class="dashboard-section"/>
    </div>
  </div>
</template>

<script>
import CheckInOut from '../components/CheckInOut.vue';
import ExerciseLog from '../components/ExerciseLog.vue'

export default {
  components:{
    CheckInOut,
    ExerciseLog
  },
  methods:{
    setCheckInOutTime(){

    }
  }
};
</script>

<style scoped>
.home {
  text-align: center;
  margin: 50px auto;
  padding: 30px;
  max-width: 800px; /* Set a maximum width to keep it from getting too wide */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
}

h1 {
  color: #333;
  font-size: 24px;
}

.subtitle {
  color: #555;
  font-size: 16px;
}

.content {
  display: flex;
  justify-content: space-around;
  align-items: stretch;
  margin-top: 20px;
}

.dashboard-section {
  border: 1px solid #ddd;
  padding: 20px;
  border-radius: 8px;
}
</style>
