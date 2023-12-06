<template>
  <div class="main">
    <div id="searchButton">
      <btn class="button" v-on:click="showEmployeeForm = !showEmployeeForm">
        Show Employee Search
      </btn>
    </div>

    <div class="searchForm" v-show="showEmployeeForm">
      <label for="userIdInput"> Enter User Id: </label>
      <input type="number" id="userIdInput" v-model="userId" />
      <btn class="button" v-on:click="employeeGetExerciseByUserId(userId)">
        Search all exercises
      </btn>
      <btn class="button" v-on:click="sendCheckIn"> Check in user </btn>

      <btn class="button" v-on:click="sendCheckOut"> Check out user </btn>
      <span>
        <p v-show="isCheckedIn">User checked in</p>
        <p v-show="!isCheckedIn">User checked out</p>
      </span>

      <div class="exercise-list-container">
        <ul class="exercise-list">
          <li
            v-for="exercise in exercises"
            :key="exercise.exercise_id"
            class="exercise-item"
          >
            <span class="exercise-name"> {{ exercise.exerciseName }} </span>
            <span class="exercise-sets"> Sets: {{ exercise.sets }} </span>
            <span v-show="exercise.mode === 'reps'" class="exercise-reps">
              Reps: {{ exercise.reps }}
            </span>
            <span
              v-show="exercise.mode === 'duration'"
              class="exercise-duration"
            >
              Duration: {{ exercise.duration }} mins
            </span>
            <span class="exercise-weight">
              Weight: {{ exercise.weight }} lbs
            </span>
            <span class="exercise-date"> Date: {{ exercise.date }} </span>
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
    submitExercise() {
      this.setUserId();
      if (this.exercise.mode === "reps") {
        this.exercise.duration = null; // Reset duration if reps mode is selected
      } else if (this.exercise.mode === "duration") {
        this.exercise.reps = null; // Reset reps if duration mode is selected
      }
      ExerciseService.addExercise(this.exercise).then((response) => {
        if (response.status === 200) {
          console.log(response.data);
        }
        this.exercise = {};
      });
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
  },
};
</script>

<style scoped>
.main {
  text-align: center;
}

.employeeSearchButton {
  border-style: solid;
  border-width: 2px;
  background-color: darkgray;
}

#searchButton {
  margin-bottom: 20px;
  margin-top: 20px;
}

.searchForm {
  align-content: center;
}

.exercise-list-container {
  margin-top: 20px;
}

.exercise-list {
  list-style: none;
  padding: 0;
}

.exercise-item {
  border: 1px solid #ccc;
  border-radius: 8px;
  margin-bottom: 10px;
  padding: 15px;
  background-color: #f9f9f9;
}

.exercise-name {
  font-size: 18px;
  font-weight: bold;
}

.exercise-sets,
.exercise-reps,
.exercise-duration,
.exercise-weight,
.exercise-date {
  display: block;
  margin-top: 5px;
  font-size: 14px;
  color: #555;
}
.button {
  border-style: solid;
  border-radius: 2px;
  background-color: grey;
  text-align: center;
  color: black;
}

#userIdInput {
  width: 25px;
}
</style>