<template>
    <div class="main">
        <h1 class="header">Placeholder instructions</h1>
        <div class="profile-picture-container">
            <img :src="profilePictureUrl" alt="Profile Picture" class="profile-picture" />
        </div>
        <!-- WebCamUI component -->
        <WebCamUI @photoTaken="photoTaken" v-if="showCamera" />

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

            const userId = 1;
            ProfileService.uploadProfilePicture(userId, this.imageSrc)
                .then(response => {
                    console.log('Profile picture set successfully');
                })
                .catch(error => {
                    console.error('Error setting profile picture:', error);
                });
        },

        toggleCamera() {
            this.showCamera = !this.showCamera;
        },
    },
};
</script>

<style>
/* Add your styles here */
</style>