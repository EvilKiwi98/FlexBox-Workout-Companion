<template>
  <div class="profile-view">
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px; background-image: url('../assets/images/FitnessBackground.jpg'); 
      background-size: cover; 
      background-position: center top;">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Hello</h1>
            <p class="text-white mt-0 mb-5">This is your profile page. You can see the progress you've made </p>
          </div>
        </div>
      </div>
    </div>
    <div class="main-container">
      <div class="exercise-container">
        <exercise-list />
      </div>
      <div class="visit-container">
        <visit-list></visit-list>
      </div>
    </div>
    <div class="chart-container">
      <visit-chart></visit-chart>
    </div>
  </div>
</template>

<script>
import ExerciseList from '../components/ExerciseList.vue';
import VisitList from '../components/VisitList.vue';
import VisitChart from '../components/VisitChart.vue';

export default {
  components: {
    ExerciseList,
    VisitList,
    VisitChart
  }
}
</script>

<style scoped>
body {
  margin: 0; /* Remove default body margin */
  background: linear-gradient(to bottom, rgba(172, 222, 255, 0.8) 33%, rgba(255, 255, 255, 0.8) 33%);
}

.profile-view {
  width: 100%;
  flex-direction: column;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff; /* Set the background color for the bottom 2/3 of the page */
  border-radius: 0 0 10px 10px; /* Apply border-radius only to the bottom corners */
}

.header {
  min-height: 600px;
  display: flex;
  align-items: center;
  background-size: cover;
  background-position: center top;
}

.main-container {
  display: flex;
  flex-wrap: wrap;
}

.exercise-container {
  flex: 2;
  margin-right: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.visit-container {
  flex: 1;
  margin-left: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.chart-container {
  width: 100%;
  margin-top: 20px;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.visit-chart {
  width: 100%;
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