<template>
  <div>
    <div class="qrcode-container">
      <StreamBarcodeReader
        @decode="onDecode"
        @loaded="onLoaded"
      ></StreamBarcodeReader>
    </div>
  </div>
</template>

<script>
import { StreamBarcodeReader } from "vue-barcode-reader";

export default {
  components: {
    StreamBarcodeReader,
  },
  data() {
    return {
      decodedResult: null,
    };
  },
  navigateToScan() {
    this.$router.push({ name: "scan" });
  },

  onDecode(result) {
    console.log(result);
    this.decodedResult = result;
    if (this.decodedResult) {
      window.location.href = this.decodedResult;
    }
  },
  redirectToWebsite() {
    // Redirect to another website based on the decoded result
    if (this.decodedResult) {
      try {
        window.location.href = this.decodedResult;
      } catch (error) {
        console.error("Error redirecting:", error);
      }
    }
  },
};
</script>

<style>
.qrcode-container {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>