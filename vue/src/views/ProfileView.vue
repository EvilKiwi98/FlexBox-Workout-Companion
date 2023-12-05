<template>
  <div>
    <exercise-list/>
  </div>
</template>

<script>


import ExerciseList from '../components/ExerciseList.vue';

export default {
  components:{
    ExerciseList
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