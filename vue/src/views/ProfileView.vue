<template>
  <div class="profile-view">

    <!-- <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px; background-image: url('@/assets/images/FitnessBackground.jpg'); 
      background-size: cover; 
      background-position: center top;">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-7 col-md-10">
           
          </div>
        </div>
      </div>
    </div> -->
  </div>

  <div class="grid-container">
    <div class="total-visit-container">
      <div class="profile-and-visit">
        <profile></profile>
        <total-visit-time></total-visit-time>
      </div>
    </div>
    <div class="exercise-container">
      <exercise-list />
    </div>
    <div class="chart-container">
      <visit-chart></visit-chart>
    </div>
  </div>
</template>

<script>
import ExerciseList from '../components/ExerciseList.vue';
import VisitChart from '../components/VisitChart.vue';
import TotalVisitTime from '../components/TotalVisitTime.vue';
import Profile from '../components/Profile.vue';

export default {
  components: {
    ExerciseList,
    VisitChart,
    TotalVisitTime,
    Profile
  }
}
</script>

<style scoped>
body {
  display: grid;
}

.profile-view {
  font-family: 'Exo 2', sans-serif;
  width: 100%;
  flex-direction: column;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 0 0 10px 10px;
}

.header {
  min-height: 600px;
  display: flex;
  align-items: center;
  background-size: cover;
  background-position: center top;
}

.total-visit-container {
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
}

.profile-and-visit {
  display: flex;
}

.exercise-container {
  grid-area: exerciseList;
  flex: 2;
  margin-right: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.chart-container {
  grid-area: chart;
  width: 92;
  padding: 40px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
}

.visit-chart {
  width: 90%;
}


.col-md-10,
.col-lg-7 {
  max-width: 58.33333%;
  flex: 0 0 58.33333%;
}

.col-md-10,
.col-lg-7 {
  position: relative;
  width: 100%;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
</style>