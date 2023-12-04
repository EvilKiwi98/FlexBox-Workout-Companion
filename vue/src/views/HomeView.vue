<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>

  </div>
</template>

<script>
import CheckInOutService from '../services/CheckInOutService';
export default {
  data() {
    return {
      CheckInOut: {
        "userVisitId": 2,
        "checkInTime": "2023-01-01T08:10:00",
        "checkOutTime": "2023-01-01T09:22:22",
        "duration": "",
        "userId": 1
      }
    }
  },
  components:{
    
  },
  methods:{
    setCheckInOutTime(){

    }
  }
};
</script>
