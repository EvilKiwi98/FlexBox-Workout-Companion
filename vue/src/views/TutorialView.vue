<template>
    <div class="profile-view">
      <LiteYouTubeEmbed :videoId="currentVideoId" />
  
      <div class="video-buttons">
        <button @click="changeVideo('qthXlEbdGEc')">Last video</button>
        <button @click="changeVideo('z5u8DDnaZSg')">Bench Press</button>
        <button @click="changeVideo('yINN07eVVyg')">Dumbbell</button>
        <button @click="changeVideo('t7ylA_jv9Yg')">Fly</button>
        <button @click="changeVideo('nzK3Vd0q0Ew')">Squats</button>
        <button @click="changeVideo('XIm_DQ_K5hU')">Leg Extension Machine</button>
        <button @click="changeVideo('lcAI2vqZXcM')">Dips</button>
        <button @click="changeVideo('W9hTmXgdJcw')">Stairmaster</button>
        <button @click="changeVideo('t5CXJA8ZTY4')">Treadmill (Walking)</button>
        <button @click="changeVideo('IqgIv2LPTiE')">Assault Bike</button>
        <button @click="changeVideo('_PALjGstyFM')">Seated Cable Row</button>
        <button @click="changeVideo('0W6nKe6GL9k')">Deadlift</button>
        <button @click="changeVideo('curSJrn6X0o')">Elliptical</button>
        <button @click="changeVideo('g-bPs3dX7MM')">Planks</button>
      </div>
    </div>
  </template>
  
  <script>
  import LiteYouTubeEmbed from '../components/LiteYouTubeEmbed.vue';
  import 'vue-lite-youtube-embed/style.css';
  
  export default {
    components: {
      LiteYouTubeEmbed
    },
    data() {
      return {
        currentVideoId: 'curSJrn6X0o' // Default video ID
      };
    },
    methods: {
      changeVideo(videoId) {
        this.currentVideoId = videoId;
      }
    }
  };
  </script>
  
  <style scoped>
  .profile-view {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  
  .video-buttons {
    margin-top: 20px;
  }
  
  .video-buttons button {
    margin-right: 10px;
  }
  </style>