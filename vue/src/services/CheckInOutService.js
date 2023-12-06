import axios from 'axios';

export default {

  checkIn(CheckInOut) {
    return axios.post('/CheckIn', CheckInOut)
  },

  checkOut(CheckInOut) {
    return axios.put('/CheckOut', CheckInOut)
  },
  getVisitsByUserId(userId){
    return axios.get(`/visits/${userId}`)
  },
  getVisitsByWeekByUserId(userId){
    return axios.get(`/visits/${userId}/week`)
  },
  getVisitsByMonthByUserId(userId, monthNum){
    return axios.get(`/visits/${userId}/${monthNum}`)
  },
  getVisitsByDayByUserId(userId, date){
    return axios.get(`/visits/${userId}/${date}`)
  }
}