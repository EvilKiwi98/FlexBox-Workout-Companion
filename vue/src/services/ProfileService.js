import axios from 'axios';

const baseUrl = '/profile'; // Adjust this based on your API endpoint

export default {
  createProfile(userId, email, profilePicBase64) {
    return axios.post(`${baseUrl}/createProfile`, {
      userId,
      email,
      profilePicBase64,
    });
  },

  getProfileByUserId(userId) {
    return axios.get(`${baseUrl}/${userId}`);
  },
};
