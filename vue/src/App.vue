<template>
  <div id="capstone-app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link>
      <span v-if="$store.state.token !== ''">
        <router-link v-bind:to="{ name: 'logout' }" class="nav-link">Logout</router-link> |
        <router-link v-bind:to="{ name: 'profile'}" class="nav-link">Profile</router-link> |
        <router-link v-bind:to="{ name: 'employee'}" class="nav-link">Employee Services</router-link>
      </span>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#capstone-app {
  font-family: 'Arial', sans-serif;
  margin: 20px;
}

#nav {
  background-color: #3498db;
  color: #ffffff;
  padding: 10px;
  text-align: center;
}

.nav-link {
  color: #fff;
  text-decoration: none;
  margin: 0 10px;
  font-size: 16px;
}

.nav-link:hover {
  text-decoration: underline;
}
</style>