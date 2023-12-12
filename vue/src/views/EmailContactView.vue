<template>
  <div class="contact-page">
  <h1 class="main-page-title page-title"> Contact</h1>
    <div class="contact-form">
        <email-contact />
    </div>
  </div>
</template>

<script>
import EmailContact from '../components/EmailContact.vue';

export default {
  data() {
    return {};
  },
  components: {
    EmailContact
  }
};
</script>

<style scoped>
.contact-page {
  text-align: center;
  padding: 20px;
}

.page-title {
  font-family: 'Exo 2', sans-serif;
  font-size: 45px;
  margin-bottom: 20px;
}

</style>