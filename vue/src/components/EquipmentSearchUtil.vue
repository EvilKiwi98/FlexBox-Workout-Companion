<template>
  <div class="main">
    <btn class="button toggle-btn" v-on:click="toggleEquipmentSearch">
      {{ showEquipmentSearch ? 'Hide Equipment Search' : 'Show Equipment Search' }}
    </btn>

    <div class="outputContainer" v-show="showEquipmentSearch">
      <div id="inputBox">
        <label for="monthNumInput">Enter Month Number:</label>
        <input type="number" class="monthNumInput" v-model="monthNum" min=0 max=12 />
      </div>
      <span class="employeeInput">
        <button v-on:click="getMostUsedDurationEquipmentByMonth(monthNum)" class="searchButton"> Show month's equipment metrics (duration) </button>
        <button v-on:click="getMostUsedRepsEquipmentByMonth(monthNum)" class="searchButton"> Show month's equipment metrics (repetition) </button>
      </span>
      <div id="outputList">
        <ul class="equipment-list" v-if="showDurationEquipment">
          <li v-for="equipment in equipmentList" :key="equipment.id" class="equipment-item">
            <span class="equipment-name">Name: {{ equipment.exerciseName }}</span>
            <span class="equipment-usage">Last month time usage: {{ equipment.duration }}</span>
          </li>
        </ul>
        <ul class="equipment-list" v-if="showRepsEquipment">
          <li v-for="equipment in equipmentList" :key="equipment.id" class="equipment-item">
            <span class="equipment-name">Name: {{ equipment.exerciseName }}</span> 
            <span class="equipment-usage">Last month rep usage: {{ equipment.reps }}</span>
          </li>
        </ul>
      </div>
    </div>

  </div>
</template>

<script>
import ExerciseService from '../services/ExerciseService';
export default {
  data() {
    return {
      monthNum: 12,

      //BOOLEANS TO TOGGLE LIST VIEW OPTIONS
      showRepsEquipment: false,
      showDurationEquipment: true,
      showEquipmentSearch: false,

      equipmentList: [],
    }
  },
  methods: {
    // TOGGLE WHOLE THING METHOD
    toggleEquipmentSearch() {
      this.showEquipmentSearch = !this.showEquipmentSearch
    },
    // METHOD FOR GETTING USAGE METRICS BY MONTH (DURATION)
    getMostUsedDurationEquipmentByMonth(monthNum) {
      console.log("oi")
      // CHANGE/RESET EXISTING BOOLEAN TOGGLE
      this.showRepsEquipment = false;
      ExerciseService.getMostUsedDurationEquipmentByMonth(monthNum)
        .then(response => {
          if (response.status === 200) {
            this.equipmentList = response.data;
            // RESET VARIABLES IF SUCCESSFUL
            this.showDurationEquipment = true;
          }
          else {
            console.log("No data found.")
          }
        })
    },

    // METHOD FOR GETTING USAGE METRICS BY MONTH (REPS)
    getMostUsedRepsEquipmentByMonth(monthNum) {
      console.log("oi")
      this.showDurationEquipment = false
      ExerciseService.getMostUsedRepsEquipmentByMonth(monthNum)
        .then(response => {
          if (response.status === 200) {
            this.equipmentList = response.data;
            // RESET MONTH NUM VARIABLE IF SUCCESSFUL?
            this.showRepsEquipment = true;
          }
          else {
            console.log("No data found.")
          }
        })
    },


  }
}

</script>

<style scoped>
.main {
  text-align: center;
  margin-top: 20px;
}

.outputContainer{
  margin-top:20px;
}

.monthNumInput{
  width:40px;
}

#outputList{
  width: 70%;
  align-content: center;
}

.searchButton {
  margin-bottom: 20px;
  background-color: #fff;
  color: #333;
  /* Set text color to a dark color */
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
  /* Added color transition */
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.toggle-btn {
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.equipment-list {
  list-style: none;
  padding: 0;
  align-content: center;
}

.equipment-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
  width:50%;
}

.equipment-item:hover {
  transform: scale(1.02);
}

.equipment-name {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-right:10px;
}

.equipment-usage{
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-left:10px;
}
</style>