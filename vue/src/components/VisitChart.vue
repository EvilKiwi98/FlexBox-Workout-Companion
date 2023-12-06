<template>
  <span>
    <button v-on:click="fetchVisitsByUserId"> Click me first</button>
    <button v-on:click="populateChartData"> Click me second </button>
  </span>
  <Bar :data="chartData" />
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
      durationValue: [],
      chartData: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June'],
        datasets: [
          {
            label: 'Data One',
            backgroundColor: '#f87979',
            data: []
          }
        ]
      }
    };
  },
  methods: {
    setUserId() {
      this.userId = this.$store.getters.getUserId;
    },
    fetchVisitsByUserId() {
      this.setUserId();
      CheckInOutService.getVisitsByUserId(this.userId)
        .then(response => {
          if (response.status === 200) {
            this.durationValue = response.data
          }
          console.log(this.durationValue)
        })
    },
    populateChartData() {

        this.chartData.labels= this.durationValue;
      
    }

    // async fetchVisitsByUserId() {
    //   try {
    //     await this.setUserId(); 
    //     const response = await CheckInOutService.getVisitsByUserId(this.userId);
    //     this.durationValue = response.data.map((visit) => visit.duration);
    //     console.log(this.durationValue);


    //     this.chartData.datasets[0].data = [];

    //     this.durationValue.forEach(element => {
    //       this.chartData.datasets[0].data.push(element);
    //     });
    //   } catch (error) {
    //     console.error('Error fetching data:', error);

    //   }
    // },
  },
  mounted() {
    this.setUserId
    this.fetchVisitsByUserId();
  },
};
</script>