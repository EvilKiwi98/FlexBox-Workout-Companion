<template>
    <the-header v-show="this.$store.state.showApp" />
    <!-- Router view for the main content -->
    <router-view/>
    <the-footer v-show="this.$store.state.showApp"/>

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
</style>