<template>
  <div>
    <!-- <canvas ref="visitChart"></canvas> -->
  </div>
</template>

<script>
// import Chart from 'chart.js';

// export default {
//   data() {
//     return {
//       chart: null,
//     };
//   },
//   mounted() {
//     this.renderLineChart();
//   },
//   methods: {
//     renderLineChart() {
//       const ctx = this.$refs.visitChart.getContext("2d");
//       this.chart = new Chart(ctx, {
//         type: "line",
//         data: {
//           labels: ["January", "February", "March", "April", "May"],
//           datasets: [
//             {
//               label: "Sample Line Chart",
//               borderColor: "rgba(75, 192, 192, 1)",
//               borderWidth: 2,
//               data: [65, 59, 80, 81, 56],
//             },
//           ],
//         },
//         options: {
//           responsive: true,
//           maintainAspectRatio: false,
//         },
//       });
//     },
//   },
// };
</script>
<style scoped>

</style>

<!-- <template>
    <div>
      <apexchart type="line" :options="chartOptions" :series="series"></apexchart>
    </div>
  </template>
  <script>
  import VueApexCharts from 'vue-apexcharts';
  export default {
    components: {
      apexchart: VueApexCharts,
    },
    data() {
      return {
        series: [{
          name: 'Desktops',
          data: [10, 41, 35, 51, 49, 62, 69, 91, 148],
        }],
        chartOptions: {
          chart: {
            type: 'line',
            height: 350,
            zoom: {
              enabled: true,
            },
          },
          dataLabels: {
            enabled: false,
          },
          stroke: {
            curve: 'smooth',
          },
          title: {
            text: 'Product Trends by Month',
            align: 'left',
          },
          grid: {
            row: {
              colors: ['#F3F3F3', 'transparent'],
              opacity: 0.5,
            },
          },
          xaxis: {
            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
          },
        },
      };
    },
  };
  </script>
   -->