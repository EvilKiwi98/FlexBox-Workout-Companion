<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <check-in-out/>
  </div>
</template>

<script>
import CheckInOut from '../components/CheckInOut.vue';

export default {
  components:{
    CheckInOut,
  },
  methods:{
    setCheckInOutTime(){

    }
  }
};
</script>

<style scoped>
.home {
  text-align: center;
  margin-top: 50px;
}

h1 {
  color: #333;
}

p {
  color: #777;
}
</style>
