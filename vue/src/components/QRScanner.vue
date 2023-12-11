<template>
  <div>
    <qrcode-stream @decode="onDecode"></qrcode-stream>
  </div>
</template>
  
  <script>
export default {
  methods: {
    onDecode(result) {
      // Handle the decoded QR code result
      console.log("Decoded QR code:", result);
      // You can perform actions based on the decoded result, such as navigating to another page
    },
  },
};
</script>

<style>
</style>