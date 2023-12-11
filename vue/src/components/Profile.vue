<template>
    <div class="container">
      <div class="profile-container">
        <h1>User Profile</h1>
        <div class="profile-details">
          <span class="profile-username">Username: {{ profile.username }}</span>
          <img v-if="profile.profilePicUrl" :src="profile.profilePicUrl" alt="Profile Picture" class="profile-picture" />
          <span class="profile-email">Email Address: {{ profile.emailAddress }}</span>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import ProfileService from "../services/ProfileService";
  /* cloudinary or firebase or just in postgres*/
  export default {
    data() {
      return {
        profile: {
          userId: null,
          username: "",
          profilePicUrl: "",
          emailAddress: ""
        }
      };
    },
    mounted() {
      this.getProfileByUserId();
    },
    methods: {
      getProfileByUserId() {
        ProfileService.getProfileByUserId(this.$store.getters.getUserId).then(
          (response) => {
            this.profile = response.data;
          }
        );
      }
    }
  };
  </script>
  
  <style scoped>
  .container {
    display: flex;
    max-width: 1200px;
    margin: 20px auto;
  }
  
  .profile-container {
    width: 66.67%;
    float: left;
    box-sizing: border-box;
    padding-right: 10px;
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
    max-width: 100%;
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
  