<template>
  <div>
    <qrcode-stream @detect="onDetect"></qrcode-stream>

  </div>
</template>

<script>
import { QrcodeStream } from 'vue-qrcode-reader'

export default {
  components: {
    QrcodeStream,
  },

  data() {
    return {
      stopCamera: false,
    };
  },
  methods: {
    onDecode(content) {
      console.log(content)
      this.stopCamera = true;
      alert(`QR Code Decoded: ${content}`);
      // You can perform additional actions with the decoded content.
    },
  },
};
</script>


<style scoped>
/* Add your component-specific styles here */
</style>
