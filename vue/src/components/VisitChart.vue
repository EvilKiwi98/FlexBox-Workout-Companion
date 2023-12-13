<template>
  <div>
    <Bar ref="chart" :data="chartData" :key="chartKey" />
    <div class="button-container">
      <button @click="viewBy('days')">Lifetime</button>
      <button @click="viewBy('weeks')">Past Week</button>
      <button @click="viewBy('months')">Month Average</button>
      <button @click="updateUserGoal">Set Goal</button>
    </div>
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement, LineElement } from 'chart.js';
import CheckInOutService from '../services/CheckInOutService';
import 'chartjs-plugin-annotation';
ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, PointElement, LineElement);

export default {
  name: 'BarChart',
  components: { Bar },
  data() {
    return {
      userId: '',
      chartData: {
        labels: [],
        datasets: [
          {
            label: 'Minutes',
            backgroundColor: '#3498db',
            data: [],
          },
        ],
      },
      chartKey: 0,
      viewMode: 'days', // Default view mode
      userGoal: 0, // Initialize with a default value
    };
  },
  computed: {
    getUserId() {
      return this.$store.getters.getUserId;
    },
  },
  methods: {
    async fetchData() {
      try {
        this.userId = this.getUserId;
        const response = await CheckInOutService.getVisitsByUserId(this.userId);
        const visits = response.data;

        if (Array.isArray(visits)) {
          if (this.viewMode === 'days') {
            const visitsByDay = visits.reduce((result, visit) => {
              const formattedDate = formatDate(visit.checkInTime);
              if (!result[formattedDate]) {
                result[formattedDate] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedDate].totalDuration += visit.duration;
              result[formattedDate].visitCount += 1;
              return result;
            }, {});

            const averageDurations = Object.keys(visitsByDay).map((date) => {
              const averageDuration =
                visitsByDay[date].totalDuration / visitsByDay[date].visitCount;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = Object.keys(visitsByDay).map((date) => formatYearMonthDay(date));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          } else if (this.viewMode === 'weeks') {
            const pastWeekDays = Array.from({ length: 7 }, (_, index) => {
              const day = new Date();
              day.setDate(day.getDate() - index);
              return day.toISOString().split('T')[0];
            }).reverse();

            const visitsByDay = visits.reduce((result, visit) => {
              const formattedDate = formatDate(visit.checkInTime);
              if (!result[formattedDate]) {
                result[formattedDate] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedDate].totalDuration += visit.duration;
              result[formattedDate].visitCount += 1;
              return result;
            }, {});

            const averageDurations = pastWeekDays.map((date) => {
              const formattedDate = formatDate(date);
              const averageDuration = visitsByDay[formattedDate]
                ? visitsByDay[formattedDate].totalDuration / visitsByDay[formattedDate].visitCount
                : 0;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = pastWeekDays.map((date) => formatMonthDay(date));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          } else if (this.viewMode === 'months') {
            const visitsByMonth = visits.reduce((result, visit) => {
              const formattedMonth = formatYearMonth(visit.checkInTime);
              if (!result[formattedMonth]) {
                result[formattedMonth] = { totalDuration: 0, visitCount: 0 };
              }
              result[formattedMonth].totalDuration += visit.duration;
              result[formattedMonth].visitCount += 1;
              return result;
            }, {});

            const averageDurations = Object.keys(visitsByMonth).map((month) => {
              const averageDuration =
                visitsByMonth[month].totalDuration / visitsByMonth[month].visitCount;
              return averageDuration.toFixed(2);
            });

            this.chartData.labels = Object.keys(visitsByMonth).map((month) => formatYearMonth(month));
            this.chartData.datasets[0].data = averageDurations;
            this.chartKey += 1;
          }
        } else {
          console.error('Received data is not an array:', visits);
        }
      } catch (error) {
        console.error('Error fetching visits:', error);
      }
    },

    viewBy(mode) {
      this.viewMode = mode;
      this.fetchData();
    },
    updateUserGoal() {
      const userGoal = prompt('Enter your goal in minutes:');
      this.userGoal = parseInt(userGoal) || 0;
      this.drawGoalLine();
    },
    drawGoalLine() {
  if (this.$refs.chart && this.$refs.chart.chart) {
    const chart = this.$refs.chart.chart;

    // Remove existing goal line if any
    chart.options.annotation.annotations = chart.options.annotation.annotations.filter(
      (annotation) => annotation.id !== 'myGoalLine'
    );

    // Add new annotation for the goal line
    const goalLineAnnotation = {
      id: 'myGoalLine',
      type: 'line',
      mode: 'horizontal',
      scaleID: 'y-axis-0',
      value: this.userGoal,
      borderColor: '#e74c3c',
      borderWidth: 2,
    };

    // Add the goal line annotation to the chart options
    chart.options.annotation.annotations.push(goalLineAnnotation);

    // Use chart.update to reflect the changes
    chart.update();
  }
},


  },

  async mounted() {
  // Fetch data when the component is mounted
  await this.fetchData();

  if (this.$refs.chart && this.$refs.chart.chart) {
    const chart = this.$refs.chart.chart;

    // Hide the right y-axis
    chart.options.scales.yAxes[1].display = false;

    // Set the max value for the left y-axis
    chart.options.scales.yAxes[0].ticks.max = this.userGoal + 1000; // Adjust as needed

    // Update the chart
    chart.update();

    this.drawGoalLine();
  }
},

};

function formatDate(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatYearMonthDay(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatMonthDay(dateString) {
  const options = { month: 'short', day: 'numeric' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function formatYearMonth(dateString) {
  const options = { year: 'numeric', month: 'long' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

</script>

<style scoped>
div {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.button-container {
  font-family: 'Exo 2', sans-serif;
  margin-top: 20px;
  display: flex;
  flex-direction: row;
}

button {
  font-family: 'Exo 2', sans-serif;
  margin: 5px;
  padding: 10px;
  font-size: 16px;
  background-color: #6ad5e5;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

button:hover {
  background-color: #2980b9;
}
</style>