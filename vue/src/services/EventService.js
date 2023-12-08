import axios from 'axios';

export default {

  addEventList() {
    return axios.post('/events')
  },
}