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
            <select @change="setCamera" v-model="deviceId" id="device">
                <option value="">-</option>
                <option v-for="camera in cameras" v-bind:key="camera.id" :value="camera.deviceId">{{ camera.label }}
                </option>
            </select>
            <button v-on:click="takePhoto" id="take-photo-button"> Take Photo!</button>
        </div>

        <div id="taken-photo-container" v-if="imageSrc">
            <span id="confirm-message">Do you want this to be your profile picture?</span>
            <span id="confirm-selection">
                <button v-on:click="setProfilePicture()" id="yes-button"> Yes </button>
                <button v-on:click="resetImage()" id="no-button"> No (retake) </button>
            </span>
            <img :src="imageSrc" class="taken-image" />
        </div>

        <div id="profile-picture-container">
            <span> Your current profile image: </span>
            <img :src="profilePictureUrl" alt="Profile Picture" id="profile-picture" />
        </div>

    </div>
</template>
  
<script>
import { ref, onMounted } from 'vue';
import ProfileService from '../services/ProfileService';


export default {
    setup() {
        const imageSrc = ref(null);
        const profilePictureUrl = ref(null); // Add this line

        const loadProfilePicture = () => {
            const userId = 1;
            ProfileService.getProfilePicture(userId)
                .then(response => {
                    console.log(response);
                    profilePictureUrl.value = response;
                })
                .catch(error => {
                    console.error('Error fetching profile picture:', error);
                });
        };

        onMounted(() => {
            loadProfilePicture();
        });

        return {
            showCamera: true,
            imageSrc,
            profilePictureUrl, // Add this line
            loadProfilePicture,
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
            a.download = "Flex_Box_Profile_Image.jpg";
            a.click();
        },
        resetImage() {
            this.imageSrc = "";
        },
        setProfilePicture() {
            if (!this.imageSrc) {
                return;
            }

            const userId = 1;
            ProfileService.uploadProfilePicture(userId, this.imageSrc)
                .then(response => {
                    console.log('Profile picture set successfully');
                })
                .catch(error => {
                    console.error('Error setting profile picture:', error);
                });
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
  
<style scoped>
.main {
    display: grid;
    text-align: center;
    background-color: #a7d6ef;
    font-family: "Exo 2", sans-serif;
    grid-template-columns: 1fr 1fr 1fr;
    grid-column-gap: 5px;
    grid-row-gap: 5px;
    grid-template-areas:
        ". header ."
        ". camera-container ."
        ". tp-container ."
        " . profile-pic ."
}

#camera-container {
    width: 540px;
    height: 675px;
    grid-area: camera-container;
}

#camera {
    grid-area: camera;
    object-fit: cover;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
}

#take-photo-button {
    grid-area: take-photo;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    margin: 5px;
}

#take-photo-button:hover {
    cursor: pointer;
    transition: transform 0.3s ease;
    transform: scale(1.08);
}

#device {
    grid-area: device;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    margin: 5px;
}

#taken-photo-container {
    width: 540px;
    height: 675px;
    display: grid;
    align-content: center;
    grid-template-columns: 1fr 1fr;
    grid-column-gap: 5px;
    grid-row-gap: 5px;
    grid-template-areas:
        "confirmation confirm-selection"
        "taken-image taken-image";
    grid-area: tp-container
}

#profile-picture-container{
    grid-area: profile-pic;
    width: 540px;
    height: 675px;
    margin-bottom: 10px;
}

#profile-picture{
    width: 100%;
    height: 100%;
    object-fit: cover;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
    margin-top:10px;
}

#confirm-message {
    grid-area: confirmation
}

#confirm-selection {
    text-align: center;
    display: flex;
    column-gap: 5px;
    grid-area: confirm-selection
}

#yes-button {
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    border-radius: 6px;
    width: 50px;
    height: 40px;
    margin: 8px;

}

#yes-button:hover {
    transition: transform 0.3s ease;
    transform: scale(1.05);
    background-color: lightgreen;
    cursor: pointer;
}

#no-button {
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
    border-radius: 6px;
    margin: 8px;
    width: 70px;
    height: 40px;


}

#no-button:hover {
    transition: transform 0.3s ease;
    transform: scale(1.05);
    background-color: lightcoral;
    cursor: pointer;
}

.taken-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    grid-area: taken-image;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.5);
}

.header {
    grid-area: header;
}


</style>
