<template>
    <div>
      <!-- Your signup form or component -->
  
      <button @click="signUp">Sign Up</button>
    </div>
  </template>


<script>
import emailjs from 'emailjs-com';

const emailServiceID = 'flex_box';
const emailTemplateID = 'flex_box';
const emailUserID = 'YOUR_EMAILJS_USER_ID';

emailjs.init(emailUserID);

export default {
  methods: {
    async signUp() {
      // Perform user signup logic

      try {
        // Assuming you have an API endpoint for user signup
        const response = await this.$axios.post('/api/signup', {
          // Include user signup data
          // ...
        });

        // If signup is successful, send a confirmation email
        if (response.data.success) {
          this.sendConfirmationEmail(response.data.user.email);
        }
      } catch (error) {
        console.error('Error signing up:', error);
      }
    },
    sendConfirmationEmail(userEmail) {
      const templateParams = {
        to_email: userEmail,
        // Other template parameters
        // ...
      };

      emailjs.send(emailServiceID, emailTemplateID, templateParams)
        .then((response) => {
          console.log('Confirmation email sent successfully:', response);
        })
        .catch((error) => {
          console.error('Error sending confirmation email:', error);
        });
    },
  },
};
</script>