import axios from 'axios';

export default {

  checkIn(user) {
    return axios.post('/CheckIn', user)
  },

  checkOut(user) {
    return axios.put('/CheckOut', user)
  }

}
