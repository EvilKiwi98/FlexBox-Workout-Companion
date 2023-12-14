<template>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <div>
    <h2>List of Exercises:</h2>
    <ul class="list">
      <li v-for="exercise in englishExercises" :key="exercise.id">
        {{ exercise.name }}
        <P>{{ exercise.description }}</P>
      </li>
      <li v-for="image in exerciseImages" :key="image.id">
        <img :src=image.image alt="Exercise Image" id="thang" />
      </li>
    </ul>
  </div>
</template>
  
<script>
import axios from 'axios';

export default {
  data() {
    return {
      englishExercises: [],
      exerciseImages: [],
      exerciseUrl: ""
    };
  },
  mounted() {
    this.getEnglishExercises();
    this.getExerciseImage();
  },


  methods: {
    async getEnglishExercises() {
      try {
        const response = await axios.get('https://wger.de/api/v2/exercise/', {
          params: {
            language: 2, // Language code for English is 2
          },
          headers: {
            Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5', // Replace 'YOUR_API_KEY' with your actual API key
          },
        });

        if (response.status === 200) {
          this.englishExercises = response.data.results;
        } else {
          console.error(`Error: ${response.status}`);
        }
      } catch (error) {
        console.error('An error occurred while fetching data:', error);
      }
    },
    async getExerciseImage() {
      try {
        const response = await axios.get('https://wger.de/api/v2/exerciseimage/', {

          headers: {
            Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5', // Replace 'YOUR_API_KEY' with your actual API key
          },
        });

        if (response.status === 200) {
          this.exerciseImages = response.data.results;
        } else {
          console.error(`Error: ${response.status}`);
        }
      } catch (error) {
        console.error('An error occurred while fetching data:', error);
      }
    },
  },
};
</script>

<style scoped>
#thang{
  width:200px;
  height:auto;
}

.list{
  list-style:none;
}
</style>
  