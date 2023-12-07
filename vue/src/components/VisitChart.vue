<template>
  <div>
    <Bar :data="chartData" :key="chartKey" />
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
      userId: "",
      chartData: {
        labels: [],
        datasets: [
          {
            label: 'Visits',
            backgroundColor: '#f87979',
            data: []
          }
        ]
      },
      chartKey: 0,
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
          this.chartData.labels = visits.map(visit => visit.checkInTime);
          this.chartData.datasets[0].data = visits.map(visit => visit.duration);
          this.chartKey += 1;
        } else {
          console.error('Received data is not an array:', visits);
        }
      } catch (error) {
        console.error('Error fetching visits:', error);
      }
    },


    populateChartData() {
      // Additional logic if needed when populating chart data
    },
  },
  async mounted() {
    // Fetch data when the component is mounted
    await this.fetchData();
  },
};
</script>
