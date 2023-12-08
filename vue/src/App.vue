<template>
    <the-header/>
    <!-- Router view for the main content -->
    <div class="logo-container">
      <img src="@/assets/Flex_Box_Logo.png" alt="Logo" class="logo"/>
    </div>
    <router-view />
    <the-footer/>

</template>

<script>
import TheHeader from './components/TheHeader.vue';
import TheFooter from './components/TheFooter.vue';
export default {
  data() {
    return {};
  },
  components: {
    TheHeader,
    TheFooter
  }
}
</script>

<style scoped>
body, html {
  margin: 0; /* Remove default margin */
}

.logo-container {
  text-align: center;
  margin-top: 10px; /* Adjust the margin as needed */
}

.logo {
  max-width: 200px; /* Ensure the logo doesn't exceed its natural size */
}
</style>