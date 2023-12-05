import axios from 'axios';

export default {

  addExercise(newExercise) {
    return axios.post('/exercise', newExercise)
  },

  checkOut(CheckInOut) {
    return axios.put('/CheckOut', CheckInOut)
  }
}