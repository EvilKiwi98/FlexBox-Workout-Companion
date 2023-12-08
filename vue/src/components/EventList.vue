<template>
    <div class="upcoming-events">
        <h2>Upcoming Events</h2>
        <ul>
            <li v-for="event in upcomingEvents" :key="event.id">
                <h3>{{ event.eventName }}</h3>
                <p>{{ event.description }}</p>
                <p>Date: {{ formatDate(event.date) }}</p>
                <p>Time: {{ formatTime(event.startTime) }} - {{ calculateEndTime(event.startTime, event.eventDuration) }}</p>
            </li>
        </ul>
    </div>
</template>
<script>
import EventService from '../services/EventService'
export default {
    data() {
        return {
            upcomingEvents: [], // Array to store upcoming events
        };
    },
    methods: {
        // Format date as per your requirement
        getEvents() {
            this.isLoading = true;
            EventService.getEventList().then(
                (response) => {
                    // Update upcomingEvents with the response data
                    this.upcomingEvents = response.data;
                }
            ).finally(() => {
                this.isLoading = false;
            });
        },
        formatDate(date) {
            const options = { year: 'numeric', month: 'long', day: 'numeric' };
            return new Date(date).toLocaleDateString('en-US', options);
        },
        formatTime(startTime){
            const formattedTime = startTime.split(':').slice(0, 2).join(':');
            return formattedTime;
        },
        // Calculate end time based on start time and duration
        calculateEndTime(startTime, duration) {
            if (!startTime || isNaN(duration)) {
                return ''; // Return an empty string or a default value if the input is not valid
            }

            // Trim startTime to exclude seconds
            const trimmedStartTime = startTime.split(':').slice(0, 2).join(':');

            const [hours, minutes] = trimmedStartTime.split(':').map(Number);

            // Calculate the total duration in minutes
            const totalMinutes = hours * 60 + minutes + duration;

            // Calculate the end time in hours and minutes
            const endHours = Math.floor(totalMinutes / 60);
            const endMinutes = totalMinutes % 60;

            // Format the end time as HH:MM with leading zeros
            return `${String(endHours).padStart(2, '0')}:${String(endMinutes).padStart(2, '0')}`;
        }
    },
    mounted() {
        // Fetch upcoming events from the database using the getevents method
        this.getEvents();
    }
};
</script>
<style scoped>
/* Add your styling here if needed */
.upcoming-events {
    /* Your styles for the sidebar component */
}

/* Additional styling for list items, etc. */
.upcoming-events ul {
    list-style-type: none;
    padding: 0;
}

.upcoming-events li {
    margin-bottom: 20px;
    border-bottom: 1px solid #ddd;
    /* Example border for separation */
}
</style>