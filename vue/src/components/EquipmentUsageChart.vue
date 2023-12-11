<template>
    <div>
      <Bar :data="chartData" :key="chartKey" />
      <div class="button-container">
        <!-- No buttons in this version -->
      </div>
  
      <!-- Equipment Search Util -->
      <EquipmentSearchUtil @search="fetchData" />
    </div>
  </template>
  
  <script>
  import { Bar } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
  import ExerciseService from '../services/ExerciseService';
  import EquipmentSearchUtil from './EquipmentSearchUtil.vue';
  
  ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);
  
  export default {
    name: 'EquipmentChart',
    components: { Bar, EquipmentSearchUtil },
    data() {
      return {
        chartData: {
          labels: [],
          datasets: [
            {
              label: 'Duration',
              backgroundColor: '#3498db',
              data: [],
            },
          ],
        },
        chartKey: 0,
      };
    },
    methods: {
      async fetchData(monthNum) {
        try {
          // Use monthNum for fetching data based on the selected month
          const response = await ExerciseService.getMostUsedDurationEquipmentByMonth(monthNum);
          const visits = response.data;
  
          // Filter out equipments that use repetitions
          const filteredVisits = visits.filter(visit => visit.measurementType === 'duration');
  
          // Calculate average duration for each equipment
          const averageDurations = {};
          filteredVisits.forEach(visit => {
            if (!averageDurations[visit.exerciseName]) {
              averageDurations[visit.exerciseName] = { totalDuration: 0, visitCount: 0 };
            }
            averageDurations[visit.exerciseName].totalDuration += visit.duration;
            averageDurations[visit.exerciseName].visitCount += 1;
          });
  
          // Calculate the final average durations
          const finalAverageDurations = Object.keys(averageDurations).map(equipmentName => {
            const averageDuration =
              averageDurations[equipmentName].totalDuration / averageDurations[equipmentName].visitCount;
            return averageDuration.toFixed(2);
          });
  
          // Use equipment names as labels
          this.chartData.labels = Object.keys(averageDurations);
          this.chartData.datasets[0].data = finalAverageDurations;
          this.chartKey += 1;
        } catch (error) {
          console.error('Error fetching visits:', error);
        }
      },
    },
    async mounted() {
      // Fetch data when the component is mounted
      await this.fetchData();
    },
  };
  </script>