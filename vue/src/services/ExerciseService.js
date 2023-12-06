import axios from 'axios';

export default {

  addExercise(newExercise) {
    return axios.post('/exercise', newExercise)
  },

  getExerciseByUserId(userId) {
    return axios.get(`/exercise/${userId}`)
  },

  getTotalVisitDurationByUserId(userId) {
    return axios.get(`/visits/${userId}/duration`)
  },
  getExerciseByDayByUserId(userId, date){
    return axios.get(`/exercise/${userId}/${date}`)
  }
}