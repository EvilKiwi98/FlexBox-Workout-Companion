<template>
    <div class="main">
        <span class="header">
            <h1>Select the camera you want to use, and take a picture you wish to set as your profile image.</h1>
            <p> Your image should be a portrait style shot, i.e shoulders and up. Make sure to smile! </p>
        </span>
        <div id="camera-container">
            <WebCam @photoTaken="photoTaken" @init="webcamInit" ref="webcam"
                :constraints="{ video: { width: { ideal: 1080 }, height: { ideal: 1350 } }, facingMode: 'environment' }"
                id="camera" />
            <select @change="setCamera" v-model="deviceId">
                <option value="">-</option>
                <option v-for="camera in cameras" v-bind:key="camera.id" :value="camera.deviceId">{{ camera.label }}
                </option>
            </select>
            <button v-on:click="takePhoto"> Take Photo!</button>
        </div>

        <div id="taken-photo-container" v-if="imageSrc">
            <span id="confirm-message">Do you want this to be your profile picture?</span>
            <button v-on:click="download" id="download-button"> Aye. </button>
            <img :src="imageSrc" class="taken-image" />
        </div>

    </div>
</template>
  
<script>
import { ref } from 'vue';

export default {
    setup() {
        const imageSrc = ref(null);
        return {
            imageSrc,
        };
    },
    data() {
        return {
            cameras: [],
            deviceId: '',
        }
    },
    methods: {
        photoTaken(PhotoTaken) {
            this.imageSrc = PhotoTaken.image_data_url
            console.log(PhotoTaken)
        },
        loadCameras() {
            this.$refs.webcam.loadCameras()
            this.cameras = this.$refs.webcam.cameras;
        },
        webcamInit(deviceId) {
            this.deviceId = deviceId
            this.$emit('init', this.deviceId)
        },
        setCamera() {
            this.$refs.webcam.changeCamera(this.deviceId === '' ? null : this.deviceId)
        },
        takePhoto() {
            // Call the takePhoto method from the WebCam component
            this.$refs.webcam.takePhoto();
        },
        photoTakenEvent({ blob, image_data_url }) {
            this.$emit('photoTaken', { blob, image_data_url })
        },
        download() {
            if (!this.imageSrc) {
                return
            }
            const a = document.createElement("a");
            a.href = this.imageSrc;
            a.download = "vue-camera-lib.jpg";
            a.click();
        },
    },
    // load cameras
    mounted() {
        this.cameras = this.$refs.webcam.cameras;
        if (this.cameras.length === 0) {
            // if no camera found, we will try to refresh cameras list each second until there is some camera
            let reloadCamInterval = setInterval(() => {
                this.loadCameras()
                if (this.cameras.length > 0) {
                    clearInterval(reloadCamInterval)
                }
            }, 1000);
        }
    },
}
</script>
  
<style>
.main {
    display: grid;
    text-align: center;
    background-color: #a7d6ef;
    font-family: "Exo 2", sans-serif;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas:
        ". header ."
        ". camera-container ."
        ". tp-container ."


}

#camera-container {
    width: 540px;
    height: 675px;
    grid-area: camera-container;
}

#taken-photo-container {
    width: 540px;
    height: 675px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-column-gap:5px;
    grid-row-gap:5px;
    grid-template-areas:
        "confirmation download"
        "taken-image taken-image";
    grid-area: tp-container
}

#confirm-message {
    grid-area: confirmation
}

#download-button {
    grid-area: download
}

.taken-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    grid-area: taken-image
}

.header {
    grid-area: header;
}
</style>
