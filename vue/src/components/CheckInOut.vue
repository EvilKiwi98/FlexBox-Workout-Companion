<template>
    <div>
      <button @click="toggleCheckInOut" :class="{ 'check-btn-in': !isCheckedIn, 'check-btn-out': isCheckedIn }">{{ checkInOutLabel }}</button>
      <div v-if="isCheckedIn" class="status-message success">
        <i class="fas fa-check-circle"></i> <span class="check-time">Checked in at: {{ CheckInOut.checkInTime.toLocaleString('en-US', { timeZone: 'EST' }) }}</span>
      </div>
      <div v-if="!isCheckedIn" class="status-message">
        <i class="fas fa-info-circle"></i> Checked out at: {{ checkOutTime }}
      </div>
    </div>
  </template>

<script>
import CheckInOutService from '../services/CheckInOutService';
export default {
    data() {
        return {
            currentTime: null,
            checkOutTime: null,
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
                                this.checkOutTime = this.CheckInOut.checkOutTime.toLocaleString('en-US', { timeZone: 'EST' })
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


<style scoped>
.check-btn-in,
.check-btn-out {
  background-color: #2ecc71; /* Green color for Check In */
  color: #fff;
  padding: 25px 50px; /* Increased padding for a bigger button */
  font-size: 20px; /* Increased font size */
  cursor: pointer;
  border: none;
  border-radius: 12px;
  transition: background-color 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1); /* Subtle box shadow for a modern look */
}

.check-btn-in:hover {
  background-color: #27ae60; /* Darker green on hover */
}

.check-btn-out {
  background-color: #e74c3c; /* Red color for Check Out */
}

.check-btn-out:hover {
  background-color: #c0392b; /* Darker red on hover */
}

/* Rest of the styles */
.status-message {
  margin-top: 20px;
  font-size: 16px;
  text-align: center;
  padding: 10px;
}

.check-time {
  color: black; /* Set the text color to black */
}

.success {
  color: #2ecc71;
}

.fa-check-circle, .fa-info-circle {
  margin-right: 5px;
}

.fa-check-circle {
  color: #2ecc71;
}

.fa-info-circle {
  color: #3498db;
}
</style>