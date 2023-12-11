<template>
  <body>
  <div class="main">
    <span id="launch-button">
      <button v-on:click="this.toggleLogin()"> Get Started! </button>
    </span>
    <div id="login">
      <form v-on:submit.prevent="login">
        <h1>Please Sign In</h1>
        <div role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div role="alert" v-if="this.$route.query.registration">
          Thank you for registering, please sign in.
        </div>
        <div class="form-input-group">
          <label for="username">Username</label>
          <input type="text" id="username" v-model="user.username" required autofocus />
        </div>
        <div class="form-input-group">
          <label for="password">Password</label>
          <input type="password" id="password" v-model="user.password" required />
        </div>
        <button type="submit">Sign in</button>
        <p>
          <router-link v-bind:to="{ name: 'register' }">Need an account? Sign up.</router-link>
        </p>
      </form>
    </div>
  </div>
</body>
</template>

<script>
import authService from "../services/AuthService";

export default {

  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false,
      showLogIn: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            const userId = response.data.user.id;
            this.$store.commit("SET_USER_ID", userId);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
    toggleLogin() {
      this.showLogIn = !this.showLogIn;
    }
  }
};
</script>

<style scoped>

body{
  align-items: center;
  background-image: url(../assets/images/gym-wallpaper.jpg);
  background-repeat:no-repeat;
  background-size:contain;
  width:1060px;
  height:706px;
}

.main{
  display:grid;
  width:1060px;
  height:706px;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-template-areas:
    ". . launch-button login"
    ". . . .";
}

#launch-button{
  grid-area:launch-button
}
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}

#login{
  grid-area:login
}
</style>