<template>
  <div class="qr-code-scanner-view">
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
  StreamBarcodeReader,

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
      window.location.href = this.decodedResult;
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