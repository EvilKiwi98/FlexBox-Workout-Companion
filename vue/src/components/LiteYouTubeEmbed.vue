<template>

<!--ADD THE FOLLOWING TO THE TEMPLATE TAG WHERE COMPONENT IS IMPORTED 
   <template>

    <LiteYouTubeEmbedComponent video-id="dQw4w9WgXcQ" video-title="Rick Astley - Never Gonna Give You Up" />
    <LiteYouTubeEmbedComponent video-id="another-video-id" video-title="Another Video Title" />
    <div class="content">
      <check-in-out class="dashboard-section" />
      <exercise-log class="dashboard-section" />
    </div>
  </div>
</template> -->

    <div>
      <LiteYouTubeEmbed :id="videoId"      />
    </div>
  </template>
  
  <script>
  import LiteYouTubeEmbed from 'vue-lite-youtube-embed';
  import 'vue-lite-youtube-embed/style.css';
  
  export default {
  props: {
    videoId: {
      type: String,
      required: true,
    },
  },
  components: {
    LiteYouTubeEmbed,
  },
};
</script>
  
  <!-- You can add scoped styles if necessary -->
  <style scoped>
  /* Add your component-specific styles here */
  </style>