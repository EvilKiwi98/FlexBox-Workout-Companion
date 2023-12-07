<template>
  <div class="utilContainer">
    <employee-user-util/>
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

.utilContainer{
  display: grid;
  grid-template-columns: 50% 50%;
  grid-column-gap: 50px;

}
</style>