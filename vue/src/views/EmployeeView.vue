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
  display: grid;
  grid-template-columns: 50% 50%;
  grid-column-gap: 50px;


}
.body{
  font-family: 'Exo 2', sans-serif;
  background-color: #a7d6ef;
  border-style:solid;
  border-color: #a7d6ef;
  border-radius:8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>