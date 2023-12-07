<template>
  <div>
    <employee-user-util/>
    <exercise-search-util/>
  </div>
</template>

<script>
import EmployeeUserUtil from '../components/EmployeeUserUtil.vue';
import ExerciseSearchUtil from '../components/ExerciseSearchUtil.vue';

export default {
  data() {
    return {};
  },
  components:{
    EmployeeUserUtil,
    ExerciseSearchUtil
  }
};
</script>

<style scoped>

</style>