<template>
    <div>
        <button>Check In</button>
        <button>Check Out</button>

    </div>
</template>

<script>
import CheckInOutService from '../services/CheckInOutService';
export default {
    data() {
        return {
            currentTime: null,
            CheckInOut: {
                userVisitId: "",
                checkInTime: "",
                checkOutTime: "",
                duration: "",
                userId: ""
            }
        }
    },
    methods: {
        getCurrentTime() {
            this.currentTime = new Date();
        },
        setCheckInTime() {
            this.CheckInOut.checkInTime = this.getCurrentTime
        },
        setUserId() {
            this.CheckInOut.userId = this.$store.getters.getUserId;
        }
    }
}

</script>
<style></style>