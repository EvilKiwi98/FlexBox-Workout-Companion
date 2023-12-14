<template>
    <div>
      <h2>List of Exercises:</h2>
      <button @click="loadPreviousPage" :disabled="offset === 0">Load Previous Page</button>
      <button @click="loadNextPage">Load Next Page</button>
      <ul class="list">
        <li v-for="exercise in englishExercises" :key="exercise.id">
          {{ exercise.name }}
          <p>{{ sanitizeHTML(exercise.description) }}</p>
        </li>
        <li v-for="image in exerciseImages" :key="image.id">
          <img :src="image.image" alt="Exercise Image" id="thang" />
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
        exerciseUrl: "",
        offset: 0,
        limit: 20,
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
              language: 2,
              limit: this.limit,
              offset: this.offset,
            },
            headers: {
              Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5',
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
              Authorization: '0cbf2789d52b1545ca9b839866d21f12c428a9e5',
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
      sanitizeHTML(html) {
        const doc = new DOMParser().parseFromString(html, 'text/html');
        return doc.body.textContent || '';
      },
      loadNextPage() {
        this.offset += this.limit;
        this.getEnglishExercises();
      },
      loadPreviousPage() {
        if (this.offset >= this.limit) {
          this.offset -= this.limit;
          this.getEnglishExercises();
        }
      },
    },
  };
  </script>
  
  <style scoped>
  #thang {
    width: 200px;
    height: auto;
  }
  
  .list {
    list-style: none;
  }
  </style>
  