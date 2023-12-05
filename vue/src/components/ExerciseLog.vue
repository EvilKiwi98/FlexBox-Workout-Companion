<template>
    <div>
        <h1>Please log your exercise</h1>
        <form class="exerciseForm">
            <label for="exerciseName">Exercise Name:</label>
            <input type="text" id="exerciseName" v-model="exercise.exerciseName" required>

            <label for="reps">Reps:</label>
            <input type="number" id="reps" v-model="exercise.reps" required>

            <label for="weight">Weight:</label>
            <input type="number" id="weight" v-model="exercise.weight" required>

            <label for="date">Date:</label>
            <input type="date" id="date" v-model="exercise.date" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</template>
<script>
export default {
    data() {
        return {
            exercise: {
                exerciseName: "",
                userId: "",
                exerciseId: "",
                reps: "",
                weight: "",
                date: ""

            }
        }
    }
}
</script>
<style></style>