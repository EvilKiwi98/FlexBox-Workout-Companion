import axios from 'axios';

export default {

  checkIn(CheckInOut) {
    return axios.post('/CheckIn', CheckInOut)
  },

  checkOut(CheckInOut) {
    return axios.put('/CheckOut', CheckInOut)
  }

}
