<template>
    <div class="main">
        <h1 class="header">Placeholder instructions</h1>

        <WebCamUI @photoTaken="photoTaken" />

        <h3 class="sub-header">Last photo</h3>
        <img :src="imageSrc" class="image" v-if="imageSrc" />
        <div class="message" v-else>Click on Take a photo first</div>

        <div class="button-container" v-if="imageSrc">
            <button @click="download" type="button" class="download-button">Download image</button>
        </div>
    </div>
</template>
  
<script>
import { ref } from 'vue';

export default {
    // VARIABLES
    showCamera:true,

    //INITIALIZES THE imageSrc VARIABLE AS REACTIVE, TIED TO THE photoTaken METHOD
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
        // TOGGLE CAMERA METHOD
        toggleCamera(){
            this.showCamera = !this.showCamera
        }
    },
};
</script>
  
<style>
</style>
