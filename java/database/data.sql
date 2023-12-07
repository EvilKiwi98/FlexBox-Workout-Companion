BEGIN TRANSACTION;

--Registered users
INSERT INTO users (user_id,username,password_hash,role) VALUES (1,'user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (user_id,username,password_hash,role) VALUES (2,'admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (user_id,username,password_hash,role) VALUES (3,'employee','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_EMPLOYEE');

--Member logged Visits
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-21 05:25:00', '2023-11-21 06:12:00', 47);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-23 06:35:00', '2023-11-23 07:32:00', 57);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-24 07:42:00', '2023-11-24 08:56:00', 74);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-28 04:36:00', '2023-11-28 05:43:00', 67);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-29 05:53:00', '2023-11-29 07:20:00', 87);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-30 07:12:00', '2023-11-30 09:00:00', 108);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-01 07:25:00', '2023-12-01 08:57:00', 92);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-04 07:10:00', '2023-12-04 09:00:00', 110);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-05 06:58:00', '2023-12-05 08:30:00', 92);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-07 07:15:00', '2023-12-07 08:45:00', 90);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-08 07:32:00', '2023-12-08 08:25:00', 53);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-09 03:22:00', '2023-12-09 07:18:00', 236);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-12 07:47:00', '2023-12-12 08:32:00', 45);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-13 06:27:00', '2023-12-13 08:39:00', 132);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-14 05:12:00', '2023-12-14 07:25:00', 133);

--Employee Logged Visits
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-01 08:00:00', '2023-11-01 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-11 08:00:00', '2023-11-11 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-11-30 08:15:00', '2023-11-30 08:45:00', 30);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-12-05 10:00:00', '2023-12-05 11:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (3, '2023-12-03 09:00:00', '2023-12-03 09:30:00', 30);

--Members logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-21', 1, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-21', 3, 10, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 20, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Pulley', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-11-23', 3, 12, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-23', 1, 0, 15, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-24', 1, 0, 34, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 1, '2023-11-24', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-24', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-11-24', 3, 0, 25, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-11-24', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-28', 1, 0, 34, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-28', 3, 7, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-28', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-28', 3, 12, 0, 15, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-29', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-11-29', 3, 7, 0, 15, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-11-29', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-11-29', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 1, '2023-11-29', 3, 4, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-11-30', 1, 0, 32, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-11-30', 2, 0, 16, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-11-30', 1, 0, 37, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-01', 1, 0, 42, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-01', 3, 10, 0, 65, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Lat Pulldown', 1, '2023-12-01', 3, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Rowing Machine', 1, '2023-12-01', 3, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-04', 1, 0, 54, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Fly', 1, '2023-12-04', 5, 10, 0, 73, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dips', 1, '2023-12-04', 3, 4, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Deadlift', 1, '2023-12-04', 4, 8, 0, 135, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-04', 3, 8, 0, 65, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-05', 1, 0, 32, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Abdominal Crunch', 1, '2023-12-05', 3, 12, 0, 0, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Russian Twist', 1, '2023-12-05', 4, 0, 7, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-05', 1, 0, 25, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-07', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Leg Press Machine', 1, '2023-12-07', 3, 10, 0, , 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-12-07', 1, 0, 0,50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 1, '2023-12-07', 1, 0, 0, 0, 'reps');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-12-09', 1, 0, 35, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-12-12', 1, 0, 35, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-12-13', 1, 0, 35, 0, 'duration');

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Stairmaster', 1, '2023-12-14', 1, 0, 35, 0, 'duration');

--Employee Logged Workout
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 3, '2023-11-27', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 3, '2023-11-29', 2, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 3, '2023-12-05', 5, 10, 0, 100, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 3, '2023-12-06', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbbells', 3, '2023-12-09', 2, 10, 0, 50, 'reps');

--Listed Equipment
INSERT INTO equipment (equipment_id, equipment_name) VALUES (1,'Bench Press');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (2, 'Treadmill');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (3, 'Dumbbells');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (4, 'Lat Pulldown');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (5, 'Rowing Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (6, 'Stairmaster');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (7, 'Squats');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (8, 'Russian Twist');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (9, 'Leg Press Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (10, 'Fly');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (11, 'Dips');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (12, 'Abdominal Crunch');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (13, 'Elliptical Machine');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (14, 'Deadlift');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (15, 'Planks');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (16, 'Assault Bike');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (17, 'Push Ups');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (18, 'Pulley')

COMMIT TRANSACTION;
