<template>
  <div class="profile-view">
    <exercise-list />
    <visit-list></visit-list>
  </div>
</template>

<script>


import ExerciseList from '../components/ExerciseList.vue';
import VisitList from '../components/VisitList.vue';
export default {
  components:{
    ExerciseList,
    VisitList
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