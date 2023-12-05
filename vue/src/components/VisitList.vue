<template>
  <div>
    <h2>Visit Metrics</h2>
    <ul class="visit-list">
      <li v-for="visit in visits" :key="visit.visitId" class="visit-item">
        <span class="visit-id">{{ visit.visitId }}</span>
        <span class="visit-checkInDate"> Check In: {{ formatDateTime(visit.checkInTime) }} </span>
        <span class="visit-checkOutDate"> Check Out: {{ formatDateTime(visit.checkOutTime) }} </span>
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

    formatDateTime(dateTime) {
      const options = {
        year: "numeric",
        month: "2-digit",
        day: "2-digit",
        hour: "2-digit",
        minute: "2-digit",
        hour12: true,
      };
      return new Date(dateTime).toLocaleString("en-US", options);
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

<style scoped>
.visit-list {
  list-style: none;
  padding: 0;
}

.visit-item {
  border: 1px solid #ccc;
  border-radius: 8px;
  margin-bottom: 10px;
  padding: 15px;
  background-color: #f9f9f9;
}

.visit-id {
  font-size: 16px;
  font-weight: bold;
}

.visit-checkInDate,
.visit-checkOutDate,
.visit-duration {
  display: block;
  margin-top: 5px;
  font-size: 14px;
  color: #555;
}
</style>