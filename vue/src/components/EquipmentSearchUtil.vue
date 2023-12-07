<template>
  <div class="main">
    <btn class="button toggle-btn" v-on:click="toggleEquipmentSearch">
      {{ showEquipmentSearch ? 'Hide Equipment Search' : 'Show Equipment Search' }}
    </btn>

    <div class="outputContainer" v-show="showEquipmentSearch">
      <div id="input-box">
        <label for="monthNumInput">Enter Month Number:</label>
        <input type="number" class="monthNumInput" v-model="monthNum" min=0 max=12 />
      </div>
      <span class="employeeInput">
        <button v-on:click="getMostUsedDurationEquipmentByMonth(monthNum)" class="searchButton"> Show month's equipment metrics (duration) </button>
        <button v-on:click="getMostUsedRepsEquipmentByMonth(monthNum)" class="searchButton"> Show month's equipment metrics (repetition) </button>
      </span>
      <div id="output-list">
        <ul id="equipment-list-duration" class="equipment-list" v-show="showDurationEquipment">
          <li v-for="equipment in equipmentList" :key="equipment.id" class="equipment-item">
            <span class="equipment-name">Name: {{ equipment.exerciseName }}</span>
            <span class="equipment-usage">Last month time usage: {{ equipment.duration }}</span>
          </li>
        </ul>
        <ul id="equipment-list-reps" class="equipment-list" v-show="showRepsEquipment">
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
    // TOGGLE METHODS
    toggleEquipmentSearch() {
      this.showEquipmentSearch = !this.showEquipmentSearch
    },
    toggleShowAllEquipment(){
      this.showDurationEquipment = true;
      this.showRepsEquipment = true;
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

#input-box{
  grid-area: input-box;
}

.employeeInput{
  grid-area: employee-input;
}

.outputContainer{
  margin-top:20px;
  display:grid;
  grid-template-columns:1fr 1fr;
  grid-row-gap:20px;
  grid-template-areas:

    "input-box input-box"
    "employee-input employee-input"
    "output-list output-list"


}

.monthNumInput{
  width:40px;
}

#output-list{
  grid-area: output-list;
  display: flex;
  justify-content: center;

}

.equipment-list{
  grid-area: equipment-list
}

#equipment-list-duration{
  list-style:none;
  grid-area: list-duration;
}

#equipment-list-reps{
  list-style:none;
  grid-area: list-rep;
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