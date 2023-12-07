<template>
  <div class="main">
    <div id="searchButton">
      <btn class="button toggle-btn" v-on:click="toggleEmployeeForm">
        {{ showEmployeeForm ? 'Hide Employee Search' : 'Show Employee Search' }}
      </btn>
    </div>

    <div class="searchForm" v-show="showEmployeeForm">
      <label for="userIdInput">Enter User Id:</label>
      <input type="number" id="userIdInput" v-model="userId" min=0 />
      <btn class="button search-btn" v-on:click="employeeGetExerciseByUserId(userId)">
        Search all exercises
      </btn>
      <button @click="toggleCheckInOut" :class="{ 'check-btn-in': !isCheckedIn, 'check-btn-out': isCheckedIn }">
        {{ checkInOutLabel }}
      </button>
      <span>
        <p v-show="isCheckedIn" class="status-message">User checked in</p>
        <p v-show="!isCheckedIn" class="status-message">User checked out</p>
      </span>

      <div class="exercise-list-container">
        <ul class="exercise-list">
          <li v-for="exercise in exercises" :key="exercise.exercise_id" class="exercise-item">
            <span class="exercise-name">{{ exercise.exerciseName }}</span>
            <span class="exercise-sets">Sets: {{ exercise.sets }}</span>
            <span v-show="exercise.mode === 'reps'" class="exercise-reps">Reps: {{ exercise.reps }}</span>
            <span v-show="exercise.mode === 'duration'" class="exercise-duration">Duration: {{ exercise.duration }}
              mins</span>
            <span class="exercise-weight">Weight: {{ exercise.weight }} lbs</span>
            <span class="exercise-date">Date: {{ exercise.date }}</span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import ExerciseService from "../services/ExerciseService";
import CheckInOutService from "../services/CheckInOutService";

export default {
  data() {
    return {
      totalVisitDuration: "",
      exercises: [],
      showEmployeeForm: false,
      userId: null,
      exercise: {
        exerciseName: "",
        userId: "",
        exerciseId: "",
        sets: "",
        reps: "",
        duration: "",
        weight: "",
        date: "",
        mode: "", // Added property for reps or duration choice
      },
      currentTime: null,
      checkOutTime: null,
      isCheckedIn: false,
      visitDuration: "",
      CheckInOut: {
        userVisitId: "",
        checkInTime: "",
        checkOutTime: "",
        duration: "",
        userId: "",
      },
    };
  },
  methods: {
    toggleEmployeeForm() {
      this.showEmployeeForm = !this.showEmployeeForm;
    },
    employeeGetExerciseByUserId(userId) {
      ExerciseService.getExerciseByUserId(userId).then((response) => {
        this.isLoading = false;
        this.exercises = response.data;
      });
    },
    formatDate(date) {
      const options = { year: "numeric", month: "short", day: "numeric" };
      return new Date(date).toLocaleDateString("en-US", options);
    },
    getTotalVisitDurationByUserId() {
      ExerciseService.getTotalVisitDurationByUserId(
        this.$store.getters.getUserId
      ).then((response) => {
        if (response.status === 200) {
          this.totalVisitDuration = response.data;
        }
      });
    },
    getCurrentTime() {
      this.currentTime = new Date();
      // this.currentTime = this.currentTime.toLocaleString('en-US', { timeZone: 'America/New_York' });
    },
    setCheckInTime() {
      this.CheckInOut.checkInTime = this.currentTime;
    },
    setCheckOutTime() {
      this.CheckInOut.checkOutTime = this.currentTime;
    },
    setUserId() {
      this.CheckInOut.userId = this.userId;
    },
    calculateDuration() {
      const checkInTime = new Date(this.CheckInOut.checkInTime);
      const checkOutTime = new Date(this.CheckInOut.checkOutTime);
      const durationInMillis = checkOutTime - checkInTime;
      const durationInMinutes = Math.floor(durationInMillis / (1000 * 60));
      this.CheckInOut.duration = `${durationInMinutes}`;
    },
    sendCheckIn() {
      this.getCurrentTime(),
        this.setCheckInTime(),
        this.setUserId(),
        CheckInOutService.checkIn(this.CheckInOut).then((response) => {
          if (response.status === 200) {
            //we are successful
            console.log(response.data);
            this.CheckInOut.userVisitId = response.data.userVisitId;
            this.isCheckedIn = true;
          }
        });
    },
    sendCheckOut() {
      this.getCurrentTime(),
        this.setCheckOutTime(),
        this.setUserId(),
        this.calculateDuration();
      this.visitDuration = this.CheckInOut.duration;
      CheckInOutService.checkOut(this.CheckInOut).then((response) => {
        if (response.status === 200) {
          //we are successful
          console.log(response.data);
          this.isCheckedIn = false;
          this.CheckInOut.checkOutTime = new Date();
          this.checkOutTime = this.CheckInOut.checkOutTime.toLocaleString(
            "en-US",
            { timeZone: "EST" }
          );

          this.CheckInOut = {};
        }
      });
    },
    toggleCheckInOut() {
      if (this.isCheckedIn) {
        this.sendCheckOut();
      } else {
        this.sendCheckIn();
      }
    },
  },
  computed: {
    formattedCheckInTime() {
      return this.CheckInOut.checkInTime.toLocaleString("en-US", { timeZone: "EST" });
    },
    formattedCheckOutTime() {
      return this.CheckInOut.checkOutTime.toLocaleString("en-US", { timeZone: "EST" });
    },
    checkInOutLabel() {
      return this.isCheckedIn ? "Check Out" : "Check In";
    },
  },
};
</script>

<style scoped>
.main {
  text-align: center;
  margin-top: 20px;
}

#searchButton {
  margin-bottom: 20px;
}

.toggle-btn {
  background-color: #3498db;
  color: #fff;
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.searchForm {
  align-content: center;
  margin-top: 20px;
}

.button.search-btn {
  background-color: #fff;
  color: #333;
  /* Set text color to a dark color */
  padding: 10px 20px;
  margin: 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;
  /* Added color transition */
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
}

.button.search-btn:hover {
  background-color: #f0f0f0;
  /* Light grey on hover */
}

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

.status-message {
  margin-top: 10px;
  font-size: 16px;
  text-align: center;
  padding: 5px;
  color: #090909;
  border-radius: 5px;
}

.exercise-list-container {
  margin-top: 20px;
}

.exercise-list {
  list-style: none;
  padding: 0;
}

.exercise-item {
  border: 1px solid #ddd;
  border-radius: 8px;
  margin-bottom: 20px;
  padding: 20px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.exercise-item:hover {
  transform: scale(1.02);
}

.exercise-details {
  display: block;
}

.exercise-name {
  font-size: 20px;
  font-weight: bold;
  color: #333;
}

.exercise-sets,
.exercise-reps,
.exercise-duration,
.exercise-weight,
.exercise-date {
  display: block;
  margin-top: 8px;
  font-size: 14px;
  color: #555;
}

.exercise-reps,
.exercise-duration {
  font-style: italic;
}

.exercise-date {
  color: #777;
}

</style>