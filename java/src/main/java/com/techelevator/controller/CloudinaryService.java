package com.techelevator.controller;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.stereotype.Service;

    @Service
    public class CloudinaryService {

        private final Cloudinary cloudinary;

        public CloudinaryService() {
            this.cloudinary = new Cloudinary(ObjectUtils.asMap(
                    "cloud_name", "dmkpoorrs",
                    "api_key", "983621534851323",
                    "api_secret", "TTZ65e-TJeuJJN8zqvdSt4K1Ek8"
            ));
        }

        public Cloudinary getCloudinary() {
            return cloudinary;
        }

        public String uploadProfilePicture(byte[] imageData) {
            // Use the configured Cloudinary instance to upload the profile picture
            // You can then store the returned URL in your user profile data
            // Example: cloudinary.uploader().upload(imageData, ObjectUtils.emptyMap()).get("secure_url");
            return "https://your_cloud_name.cloudinary.com/path/to/profile-image.jpg"; // Replace with actual URL
        }

        public String getProfilePictureUrl(String userId) {
            // Use the configured Cloudinary instance to retrieve the profile picture URL
            // Example: cloudinary.url().generate(userId);
            return "https://your_cloud_name.cloudinary.com/path/to/profile-image.jpg"; // Replace with actual URL
        }
    }


