<template>
  <div class="container">
    <div class="profile-container">
      <div class="profile-box">
        <h1 class="profile-title">My Profile</h1>
        <div class="profile-content">
          <img v-if="profile.profilePicUrl" :src="profile.profilePicUrl" alt="Profile Picture" class="profile-picture" />
          <div class="profile-details">
            <span class="profile-username">Username: {{ profile.username }}</span>
            <span class="profile-email">Email Address: {{ profile.emailAddress }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, watchEffect } from 'vue';
import { useStore } from 'vuex';
import ProfileService from "../services/ProfileService";

export default {
  setup() {
    const store = useStore();
    const profile = ref({
      userId: null,
      username: "",
      profilePicUrl: "",
      emailAddress: ""
    });

    const loadProfileData = async () => {
      const userId = store.getters.getUserId;
      try {
        // Fetch user profile data
        const profileResponse = await ProfileService.getProfileByUserId(userId);
        profile.value = profileResponse.data;

        // Fetch profile picture
        const pictureResponse = await ProfileService.getProfilePicture(userId);
        profile.value.profilePicUrl = pictureResponse;
      } catch (error) {
        console.error('Error fetching profile data:', error);
      }
    };

    onMounted(loadProfileData);
    watchEffect(() => {
      loadProfileData(); // Watch for changes in userId and reload the profile data
    });

    return {
      profile,
    };
  },
};
</script>

  
<style scoped>
.container {
  display: flex;
  max-width: 1200px;
  margin: 20px auto;
}

.profile-container {
  width: 100%; /* Adjust the width as needed */
  box-sizing: border-box;
  padding-right: 10px;
  display: flex;
  justify-content: center;
}

.profile-box {
  border: 5px solid #6ad5e5;
  border-radius: 10px;
  overflow: hidden;
  padding: 20px;
  max-width: 400px; /* Adjust the width as needed */
  box-sizing: border-box;
  text-align: center; /* Center text content within the box */
}

.profile-title {
  font-size: 24px;
  color: #333;
}

.profile-content {
  text-align: center;
}

.profile-details {
  margin-top: 20px;
}

.profile-username {
  font-size: 20px;
  font-weight: bold;
  color: #333;
}

.profile-picture {
  max-width: 100%; /* Adjust the width as needed */
  margin-top: 10px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.profile-email {
  display: block;
  margin-top: 10px;
  font-size: 16px;
  color: #555;
}
</style>