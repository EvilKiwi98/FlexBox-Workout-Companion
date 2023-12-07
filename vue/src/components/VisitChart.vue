<template>
  <div>
    <Bar :data="chartData" :key="chartKey" />
    <div class="button-container">
      <button @click="viewBy('days')">View by Days</button>
      <button @click="viewBy('weeks')">View Past Week Time Spent</button>
      <button @click="viewBy('months')">View Average Time Spent by Month</button>
    </div>
  </div>
</template>

<script>
import { Bar } from 'vue-chartjs';
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
import CheckInOutService from '../services/CheckInOutService';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

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

    console.log('Response:', response);

    // Assuming the actual visits are in the 'data' property
    const visits = response.data;

    if (Array.isArray(visits)) {
      if (this.viewMode === 'days') {
        // Group visits by day
        const visitsByDay = visits.reduce((result, visit) => {
          const formattedDate = formatDate(visit.checkInTime);
          if (!result[formattedDate]) {
            result[formattedDate] = { totalDuration: 0, visitCount: 0 };
          }
          result[formattedDate].totalDuration += visit.duration;
          result[formattedDate].visitCount += 1;
          return result;
        }, {});

        // Calculate average duration for each day
        const averageDurations = Object.keys(visitsByDay).map((date) => {
          const averageDuration =
            visitsByDay[date].totalDuration / visitsByDay[date].visitCount;
          return averageDuration.toFixed(2); // Round to 2 decimal places
        });

        // Use formatted dates as labels
        this.chartData.labels = Object.keys(visitsByDay);
        this.chartData.datasets[0].data = averageDurations;
        this.chartKey += 1;
      } else if (this.viewMode === 'weeks') {
        // Display daily time spent for the past week
        const lastWeekStart = new Date();
        lastWeekStart.setDate(lastWeekStart.getDate() - lastWeekStart.getDay() - 6); // Start from the first day of the past week
        const lastWeekEnd = new Date();
        lastWeekEnd.setDate(lastWeekStart.getDate() + 6); // End on the last day of the past week

        // Filter visits for the past week
        const visitsPastWeek = visits.filter((visit) => {
          const visitDate = new Date(visit.checkInTime);
          return visitDate >= lastWeekStart && visitDate <= lastWeekEnd;
        });

        // Group visits by day
        const visitsByDay = visitsPastWeek.reduce((result, visit) => {
          const formattedDate = formatDate(visit.checkInTime);
          if (!result[formattedDate]) {
            result[formattedDate] = { totalDuration: 0, visitCount: 0 };
          }
          result[formattedDate].totalDuration += visit.duration;
          result[formattedDate].visitCount += 1;
          return result;
        }, {});

        // Calculate average duration for each day
        const averageDurations = Object.keys(visitsByDay).map((date) => {
          const averageDuration =
            visitsByDay[date].totalDuration / visitsByDay[date].visitCount;
          return averageDuration.toFixed(2); // Round to 2 decimal places
        });

        // Use formatted dates as labels
        this.chartData.labels = Object.keys(visitsByDay);
        this.chartData.datasets[0].data = averageDurations;
        this.chartKey += 1;
      } else if (this.viewMode === 'months') {
        // Group visits by month
        const visitsByMonth = visits.reduce((result, visit) => {
          const formattedMonth = formatMonth(visit.checkInTime);
          if (!result[formattedMonth]) {
            result[formattedMonth] = { totalDuration: 0, visitCount: 0 };
          }
          result[formattedMonth].totalDuration += visit.duration;
          result[formattedMonth].visitCount += 1;
          return result;
        }, {});

        // Calculate average duration for each month
        const averageDurations = Object.keys(visitsByMonth).map((month) => {
          const averageDuration =
            visitsByMonth[month].totalDuration / visitsByMonth[month].visitCount;
          return averageDuration.toFixed(2); // Round to 2 decimal places
        });

        // Assuming you have a function to format the month, similar to formatWeek
        this.chartData.labels = Object.keys(visitsByMonth).map((month) => formatMonth(month));
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

    // Method to switch between view modes
    viewBy(mode) {
      this.viewMode = mode;
      this.fetchData();
    },


    populateChartData() {
      // Additional logic if needed when populating chart data
    },

    getVisitsByWeekByUserId() {
      this.isLoading = true;
      CheckInOutService.getVisitsByWeekByUserId(this.$store.getters.getUserId).then(
        (response) => {
          this.visits = response.data;
        }
      );
    },
  },
  async mounted() {
    // Fetch data when the component is mounted
    await this.fetchData();
  },
};

function formatDate(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}
// Function to get the week number for a given date
function getWeekNumber(date) {
  const d = new Date(date);
  d.setHours(0, 0, 0, 0);
  d.setDate(d.getDate() + 4 - (d.getDay() || 7));
  const yearStart = new Date(d.getFullYear(), 0, 1);
  const weekNumber = Math.ceil((((d - yearStart) / 86400000) + 1) / 7);
  return weekNumber;
}

function formatWeek(week) {
  return `Week ${week}`;
}

function formatMonth(dateString) {
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
  margin-top: 20px;
  display: flex;
  flex-direction: row; /* Set the direction to row */
}

button {
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