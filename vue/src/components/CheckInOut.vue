<template>
    <div>
        <button @click="toggleCheckInOut">{{ checkInOutLabel }}</button>
        <p v-if="isCheckedIn">You have check in at: {{ CheckInOut.checkInTime }}</p>
        <p v-if="!isCheckedIn">You have checked out at: {{ currentTime }}</p>

    </div>
</template>

<script>
import CheckInOutService from '../services/CheckInOutService';
export default {
    data() {
        return {
            currentTime: null,
            isCheckedIn: false,
            CheckInOut: {
                userVisitId: "",
                checkInTime: "",
                checkOutTime: "",
                duration: "",
                userId: "",

            }
        }
    },
    computed: {
        checkInOutLabel() {
            return this.isCheckedIn ? 'Check Out' : 'Check In';
        }
    },
        methods: {
            getCurrentTime() {
                this.currentTime = new Date()
                // this.currentTime = this.currentTime.toLocaleString('en-US', { timeZone: 'America/New_York' });
            },
            setCheckInTime() {
                this.CheckInOut.checkInTime = this.currentTime;
            },
            setCheckOutTime() {
                this.CheckInOut.checkOutTime = this.currentTime;
            },
            setUserId() {
                this.CheckInOut.userId = this.$store.getters.getUserId;
            },
            sendCheckIn() {
                this.getCurrentTime(),
                    this.setCheckInTime(),
                    this.setUserId(),
                    CheckInOutService.checkIn(this.CheckInOut)
                        .then(response => {
                            if (response.status === 200) {
                                //we are successful
                                console.log(response.data);
                                this.CheckInOut.userVisitId = response.data.userVisitId
                                this.isCheckedIn = true

                            }
                        })
            },
            sendCheckOut() {
                this.getCurrentTime(),
                    this.setCheckOutTime(),
                    this.setUserId(),
                    CheckInOutService.checkOut(this.CheckInOut)
                        .then(response => {
                            if (response.status === 200) {
                                //we are successful
                                console.log(response.data);
                                this.isCheckedIn = false;
                                this.CheckInOut = {}
                            }
                        })
            },
            toggleCheckInOut() {
      if (this.isCheckedIn) {
        this.sendCheckOut();
      } else {
        this.sendCheckIn();
      }
            }
        }
    }



</script>
<style></style>