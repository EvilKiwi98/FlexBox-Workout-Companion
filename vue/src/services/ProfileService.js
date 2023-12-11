import axios from 'axios';

const baseUrl = '/profile'; // Adjust this based on your API endpoint

export default {

  getProfileByUserId(userId) {
    return axios.get(`${baseUrl}/${userId}`);
  },
  setProfilePicture(userId, imageUrl) {
    return axios.post(`${baseUrl}/${userId}/createProfile`, { imageUrl });
  },
};
