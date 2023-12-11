<template>
    <div class="main">
      <h1 class="header">Placeholder instructions</h1>
  
      <!-- WebCamUI component -->
      <WebCamUI @photoTaken="photoTaken" />
  
      <h3 class="sub-header">Last photo</h3>
      <img :src="imageSrc" class="image" v-if="imageSrc" />
      <div class="message" v-else>Click on Take a photo first</div>
  
      <div class="button-container" v-if="imageSrc">
        <button @click="download" type="button" class="download-button">Download image</button>
        <button @click="setProfilePicture" type="button" class="set-profile-button">Set as Profile Picture</button>
      </div>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue';
import ProfileService from '../services/ProfileService';  
  export default {
    // VARIABLES
    showCamera: true,
  
    // INITIALIZES THE imageSrc VARIABLE AS REACTIVE, TIED TO THE photoTaken METHOD
    setup() {
      const imageSrc = ref(null);
      return {
        imageSrc,
      };
    },
  
    methods: {
      photoTaken(data) {
        this.imageSrc = data.image_data_url;
        console.log(data);
      },
      download() {
        if (!this.imageSrc) {
          return;
        }
        const a = document.createElement("a");
        a.href = this.imageSrc;
        a.download = "vue-camera-lib.jpg";
        a.click();
      },
      setProfilePicture() {
        if (!this.imageSrc) {
          return;
        }
  
        // Assuming you have the user's ID available, replace 'userId' with the actual user ID
        const userId = 'userId';
  
        // Call the service method to set the profile picture
        ProfileService.setProfilePicture(userId, this.imageSrc)
          .then(response => {
            console.log('Profile picture set successfully');
          })
          .catch(error => {
            console.error('Error setting profile picture:', error);
          });
      },
      // TOGGLE CAMERA METHOD
      toggleCamera() {
        this.showCamera = !this.showCamera;
      },
    },
  };
  </script>
  
  <style>
  /* Add your styles here */
  </style>
  