<template>
  <div id="capstone-app">
    <!-- Top navigation bar -->
    <div id="top-nav">
      <router-link v-if="$store.state.token !== ''" v-bind:to="{ name: 'logout' }" class="small-nav-link logout-link">Logout</router-link>
    </div>

    <!-- Main navigation bar -->
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link>
      <span v-if="$store.state.token !== ''" class="nav-links-container">
        <router-link v-bind:to="{ name: 'profile'}" class="nav-link">Profile</router-link>
        <router-link v-bind:to="{ name: 'employee'}" class="nav-link">Employee Services</router-link>
      </span>
    </div>

    <!-- Router view for the main content -->
    <router-view />
  </div>
</template>

<style scoped>
#capstone-app {
  font-family: 'Arial', sans-serif;
  margin: 20px;
}

#top-nav {
  background-color: #f0f0f0; /* Light grey background */
  color: #ffffff; /* White text color */
  padding: 5px;
  text-align: right;
}

.small-nav-link {
  color: #ffffff; /* White text color */
  text-decoration: none;
  font-size: 12px; /* Adjust the font size as needed */
  margin: 0 10px;
  border-radius: 4px; /* Rounded corners */
}

#nav {
  background-color: #ffffff;
  color: #000000;
  padding: 10px;
  display: flex;
  align-items: center; /* Center items vertically */
}

.nav-links-container {
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.nav-link {
  color: #000000;
  text-decoration: none;
  font-size: 16px;
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 8px;
}

.logout-link {
  color: #000000;
  border-radius: 8px;
}

.logout-link:hover {
  text-decoration: underline;
  background-color: #4fa3e0;
  color: #ffffff;
}
</style>