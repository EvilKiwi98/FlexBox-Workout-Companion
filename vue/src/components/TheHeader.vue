<template>
    <div id="capstone-app">
        <div id="top-nav">
            <router-link v-if="$store.state.token !== ''" v-bind:to="{ name: 'logout' }"
                class="small-nav-link logout-link">Logout</router-link>
        </div>

        <!-- Main navigation bar -->
        <div id="nav" v-if="$store.state.token">
            <img src="@/assets/Flex_Box_Logo.png" alt="Logo" class="logo"/>

            <router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link>
            <span v-if="$store.state.token !== ''" class="nav-links-container">
                <router-link v-bind:to="{ name: 'profile' }" class="nav-link">Profile</router-link>
                <router-link v-bind:to="{ name: 'employee' }" class="nav-link">Employee Services</router-link>
                <router-link v-bind:to="{ name: 'tutorial' }" class="nav-link">Equipment Tutorials</router-link>
                <router-link v-bind:to="{ name: 'contactForm' }" class="nav-link">Contact Form</router-link>
            </span>
            <check-in-out/>
        </div>
    </div>
</template>

<script>
import CheckInOut from '../components/CheckInOut.vue';
export default {
    components:{
        CheckInOut
    }
}
</script>

<style scoped>
#capstone-app {
    font-family: 'Exo 2', sans-serif;
    margin: 20px;
}

#top-nav {
    background-color: #f0f0f0;
    /* Light grey background */
    color: #ffffff;
    /* White text color */
    padding: 5px;
    text-align: right;
}

.small-nav-link {
    color: #ffffff;
    /* White text color */
    text-decoration: none;
    font-size: 12px;
    /* Adjust the font size as needed */
    margin: 0 10px;
    border-radius: 4px;
    /* Rounded corners */
}

#nav {
    background-color: #ffffff;
    color: #000000;
    padding: 10px;
    display: flex;
    align-items: center;
    /* Center items vertically */
}

.logo {
    max-height: 170px; /* Adjust the max height of the logo as needed */
    margin-right: 20px; /* Adjust the margin as needed */
}
.nav-links-container {
    display: flex;
    justify-content: space-around;
    align-items: center;
}

.nav-link {
    color: #000000;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 8px;
    cursor:pointer;
}

.nav-link:hover{
    transition: transform 0.3s ease;
    transform: scale(1.08);
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