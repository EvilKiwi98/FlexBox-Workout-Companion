<template>
  <div class="main">
    <p id="instructions"> Search database for usage metrics by specified month. You can search by either machines that
      measure in repetitions or duration (time used)</p>

    <div id="searchButton">
      <button class="button toggle-btn" v-on:click="toggleEquipmentSearch">
        {{ showEquipmentSearch ? 'Hide Equipment Search' : 'Show Equipment Search' }}
      </button>
    </div>

    <div class="search-form" v-show="showEquipmentSearch">
      <span v-show="showErrorMessage" class="error-message">{{ errorMessage }}</span>
      <div class="input-box">
        <label for="monthNumInput">Enter Month Number:</label>
        <input type="number" id="monthNumInput" v-model="monthNum" min="1" max="12" />
      </div>
      <span class="employeeInput">
        <button v-on:click="getMostUsedDurationEquipmentByMonth" class="button search-btn">
          Show month's equipment metrics (duration)
        </button>
        <button v-on:click="getMostUsedRepsEquipmentByMonth" class="button search-btn">
          Show month's equipment metrics (repetition)
        </button>
      </span>
      <div class="error-message" v-show="showErrorMessage">{{ errorMessage }}</div>
      <div class="output-chart">
        <Bar :data="chartData" :key="chartKey" v-if="showChart" />
      </div>
    </div>
  </div>
</template>


<script>
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
import ExerciseService from '../services/ExerciseService';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

export default {
  name: 'EquipmentUsageChart',
  components: { Bar },
  data() {
    return {
      monthNum: '',
      errorMessage: '',
      showEquipmentSearch: false,
      showErrorMessage: false,
      showChart: false,
      chartData: {
        labels: [],
        datasets: [
          {
            label: 'Metric',
            backgroundColor: '#3498db',
            data: [],
          },
        ],
      },
      chartKey: 0,
    };
  },
  computed: {
    getExerciseName() {
      return this.$store.getters.getExerciseName;
    },
  },
  methods: {
    toggleEquipmentSearch() {
      this.showEquipmentSearch = !this.showEquipmentSearch;
      this.resetChart();
    },
    resetChart() {
      this.showChart = false;
      this.chartData.labels = [];
      this.chartData.datasets[0].data = [];
      this.chartKey += 1;
    },
    async fetchData(metricType) {
      try {
        const response =
          metricType === 'duration'
            ? await ExerciseService.getMostUsedDurationEquipmentByMonth(this.monthNum)
            : await ExerciseService.getMostUsedRepsEquipmentByMonth(this.monthNum);

        const visits = response.data;

        const filteredVisits = visits.filter(visit =>
          metricType === 'duration' ? visit.mode === 'duration' : visit.mode === 'reps'
        );

        const metricData = {};
        filteredVisits.forEach(visit => {
          if (!metricData[visit.exerciseName]) {
            metricData[visit.exerciseName] = { total: 0, count: 0 };
          }
          metricData[visit.exerciseName].total += metricType === 'duration' ? visit.duration : visit.reps;
          metricData[visit.exerciseName].count += 1;
        });

        const finalMetricData = Object.keys(metricData).map(equipmentName => {
          const averageMetric = metricData[equipmentName].total / metricData[equipmentName].count;
          return { label: equipmentName, data: averageMetric.toFixed(2) };
        });

        this.chartData.labels = finalMetricData.map(item => item.label);
        this.chartData.datasets[0].data = finalMetricData.map(item => item.data);
        this.showChart = true;
      } catch (error) {
        console.error('Error fetching equipment metrics:', error);
      }
    },
    getMostUsedDurationEquipmentByMonth() {
      this.resetChart();
      this.fetchData('duration');
    },
    getMostUsedRepsEquipmentByMonth() {
      this.resetChart();
      this.fetchData('reps');
    },
  },
};
</script>

<style scoped>
.main {
  text-align: center;
  margin-top: 20px;
  background-color: #a7d6ef;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
  border-radius: 10px;
}

#searchButton {
  margin-bottom: 20px;
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
</style>