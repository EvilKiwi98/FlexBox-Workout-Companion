<template>
  <div class = "body">
  <div class="utilContainer">
    <employee-user-util/>
    <equipment-search-util/>
  </div>
</div>
</template>

<script>
import EmployeeUserUtil from '../components/EmployeeUserUtil.vue';
import EquipmentSearchUtil from '../components/EquipmentSearchUtil.vue';

export default {
  data() {
    return {};
  },
  components: {
    EmployeeUserUtil,
    EquipmentSearchUtil
  }
};
</script>

<style scoped>

.utilContainer{
  font-family: 'Exo 2', sans-serif;
  display: grid;
  grid-template-columns: 50% 50%;
  grid-column-gap: 50px;


}
.body{
  font-family: 'Exo 2', sans-serif;

}
</style>