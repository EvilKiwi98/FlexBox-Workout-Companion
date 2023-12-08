<template>
    <div class="upcoming-events">
      <h2>Upcoming Events</h2>
      <ul>
        <li v-for="event in upcomingEvents" :key="event.id">
          <h3>{{ event.name }}</h3>
          <p>{{ event.description }}</p>
          <p>Date: {{ formatDate(event.date) }}</p>
          <p>Time: {{ event.startTime }} - {{ calculateEndTime(event.startTime, event.duration) }}</p>
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        upcomingEvents: [] // Array to store upcoming events
      };
    },
    methods: {
      // Format date as per your requirement
      formatDate(date) {
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        return new Date(date).toLocaleDateString('en-US', options);
      },
  
      // Calculate end time based on start time and duration
      calculateEndTime(startTime, duration) {
        const [hours, minutes] = startTime.split(':').map(Number);
        const totalMinutes = hours * 60 + minutes + duration;
        const endHours = Math.floor(totalMinutes / 60);
        const endMinutes = totalMinutes % 60;
  
        return `${String(endHours).padStart(2, '0')}:${String(endMinutes).padStart(2, '0')}`;
      }
    },
    mounted() {
      // Fetch upcoming events from the database (replace this with your actual API call)
      // Example: axios.get('/api/upcoming-events').then(response => this.upcomingEvents = response.data);
      // For simplicity, I'm using mock data here
      this.upcomingEvents = [
        {
          id: 1,
          name: 'Event 1',
          description: 'Description of Event 1',
          date: '2023-01-01',
          startTime: '10:00',
          duration: 120 // in minutes
        },
        {
          id: 2,
          name: 'Event 2',
          description: 'Description of Event 2',
          date: '2023-02-15',
          startTime: '15:30',
          duration: 90 // in minutes
        },
        // Add more events as needed
      ];
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
    border-bottom: 1px solid #ddd; /* Example border for separation */
  }
  </style>