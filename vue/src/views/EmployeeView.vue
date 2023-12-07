<template>
  <div class="userUtilContainer">
    <employee-user-util/>
  </div>
  <div class="equipmentUtilContainer" >
    <equipment-search-util/>
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
</style>