<template>
    <div>
      <h2>Visit Metrics</h2>
      <ul class="visit-list">
        <li v-for="visit in visits" :key="visit.visitId" class="visit-item">
          <span class="visit-id">{{ visit.visitId }}</span>
          <span class="visit-checkInDate"> Check In: {{ visit.checkInTime }} </span>
          <span class="visit-checkOutDate"> Check Out: {{ visit.checkOutTime }} </span>
          <span class="visit-duration"> Duration: {{ visit.duration }} </span>
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  import ExerciseService from '../services/ExerciseService';
  import CheckInOutService from '../services/CheckInOutService';
  export default {
    data() {
      return {
        visits: [],
        userId: null,
        visit: {
          visitId: "",
          userId: "",
          checkInDate: "",
          checkOutDate: "",
          duration: "",
        },
        
      };
    },
    mounted() {
      this.setUserId();
      this.getVisitsByUserId();
      this.getTotalVisitDurationByUserId();
    },
    methods: {
      setUserId() {
        this.visit.userId = this.$store.getters.getUserId;
      },
      getVisitsByUserId() {
        this.isLoading = true; 
        CheckInOutService.getVisitsByUserId(this.$store.getters.getUserId).then(
          (response) => {
            this.isLoading = false;
            this.visits = response.data;
          }
        );
      },
  
      formatDate(date) {
        const options = { year: "numeric", month: "short", day: "numeric" };
        return new Date(date).toLocaleDateString("en-US", options);
      },
      getTotalVisitDurationByUserId() {
        ExerciseService.getTotalVisitDurationByUserId(
          this.$store.getters.getUserId
        ).then((response) => {
          if (response.status === 200) {
            this.totalVisitDuration = response.data;
          }
        });
      },
    },
  };
  </script>