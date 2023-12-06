<template>
  <div>
    <exercise-list/>
    <visit-list/>
    <visit-chart/>
  </div>
</template>

<script>

import ExerciseList from '../components/ExerciseList.vue';
import VisitList from '../components/VisitList.vue';
import VisitChart from '../components/VisitChart.vue';

export default {
  components:{
    ExerciseList,
    VisitList,
    VisitChart
  }

}
</script>

<style scoped>
.profile-view {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}
</style>