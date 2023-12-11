<template>
  <div> Sample text </div>
  <button v-on:click="launchApp"> da button </button>
</template>

<script>
export default {
methods:{
    launchApp(){
        this.$store.state.showApp = true;
        this.$router.push({name : 'home'})
    }
}
}

</script>

<style>

</style>