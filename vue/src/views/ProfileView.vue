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

    <div class="grid-container">
      <div class="total-visit-container">
        <total-visit-time></total-visit-time>
      </div>
      <div class="exercise-container">
        <exercise-list />
      </div>
      <div class="visit-container">
        <visit-list></visit-list>
      </div>
      <div class="chart-container">
        <visit-chart></visit-chart>
      </div>
    </div>
  </div>
</template>

<script>
import ExerciseList from '../components/ExerciseList.vue';
import VisitList from '../components/VisitList.vue';
import VisitChart from '../components/VisitChart.vue';
import TotalVisitTime from '../components/TotalVisitTime.vue';

export default {
  components: {
    ExerciseList,
    VisitList,
    VisitChart,
    TotalVisitTime
  }
}
</script>

<style scoped>
body {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-template-areas: 
  "header header header header"
  "visitTime visitTime visitTime visitTime"
  "exerciseList exerciseList . visitList"
  "chart chart chart chart";
}

.profile-view {
  width: 100%;
  flex-direction: column;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  /* Set the background color for the bottom 2/3 of the page */
  border-radius: 0 0 10px 10px;
  /* Apply border-radius only to the bottom corners */
}

.header {
  grid-area: header;
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

.total-visit-container {
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px; /* Add margin to separate from the containers below */
}

.main-container {
  display: flex;
  flex-wrap: wrap;
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

.visit-container {
  grid-area: visitList;
  flex: 1;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.chart-container {
  grid-area: chart;
  width: 100%;
  padding: 20px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  margin-top: 20px; /* Add margin to separate from the containers above */
}

.total-visit-container {
  grid-area: visitTime;
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