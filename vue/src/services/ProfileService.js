import axios from 'axios';

export default {

  createProfile(newProfile) {
    return axios.post('/profile', newProfile)
  },

  getProfileByUserId(userId) {
    return axios.get(`/profile/${userId}`)
  },
}