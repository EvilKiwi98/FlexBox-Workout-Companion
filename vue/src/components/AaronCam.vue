<template>
    <div class="main">
        <WebCamUI @photoTaken="photoTaken" />

        <h3 class="sub-header">Last photo</h3>
        <img :src="imageSrc" class="image" v-if="imageSrc" />
        <div class="message" v-else>Click on Take a photo first</div>

        <div class="button-container" v-if="imageSrc">
            <button @click="download" type="button" class="download-button">Download image</button>
            <button @click="uploadToCloudinary" type="button" class="upload-button">Upload to Cloudinary</button>
        </div>
    </div>
</template>
  
<script>
import { ref } from 'vue';
import cloudinary from 'cloudinary-core';
import ProfileService from '../services/ProfileService';

const cl = cloudinary.Cloudinary.new({ cloud_name: 'dmkpoorrs' });

export default {
  data() {
    return {
      showCamera: true,
      imageSrc: null,
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

    uploadToCloudinary() {
      if (!this.imageSrc) {
        return;
      }
        console.log("help",cl)
      cl.openUploadWidget(
        {
          cloudName: 'dmkpoorrs',
          uploadPreset: 'w8pdmq3m', // Replace with your Cloudinary upload preset
          sources: ['local', 'url', 'camera', 'image_search'], // Adjust as needed
        },
        (error, result) => {
          if (!error && result && result.event === 'success') {
            console.log('Upload Widget result:', result.info);
            // Handle the Cloudinary response as needed
          } else {
            console.error('Upload Widget error:', error);
          }
        }
      );
    },

    toggleCamera() {
      this.showCamera = !this.showCamera;
    },

    async uploadToBackend() {
      if (!this.imageSrc) {
        return;
      }

      const base64String = this.imageSrc.split(',')[1];

      try {
        const response = await ProfileService.createProfile(1, 'user@example.com', base64String);
        console.log(response.data);
        // Handle the backend response if needed
      } catch (error) {
        console.error(error);
        // Handle errors
      }
    },
  },
};

</script>
  
<style></style>
  