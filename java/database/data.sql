BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-01-01 08:00:00', '2023-01-01 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-05 10:00:00', '2023-12-05 11:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-12-03 09:00:00', '2023-12-03 09:30:00', 30);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-11 08:00:00', '2023-11-11 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (1, '2023-11-30 08:15:00', '2023-11-30 08:45:00', 30);

INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (2, '2023-01-01 08:00:00', '2023-01-01 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (2, '2023-12-05 10:00:00', '2023-12-05 11:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (2, '2023-12-03 09:00:00', '2023-12-03 09:30:00', 30);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (2, '2023-11-11 08:00:00', '2023-11-11 09:00:00', 60);
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration) VALUES (2, '2023-11-30 08:15:00', '2023-11-30 08:45:00', 30);

INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 1, '2023-12-05', 5, 10, 0, 200, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 1, '2023-12-03', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbell', 1, '2023-11-30', 2, 10, 0, 50, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Bench Press', 2, '2023-12-05', 5, 10, 0, 100, 'reps');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Treadmill', 2, '2023-12-03', 1, 0, 45, 0, 'duration');
INSERT INTO exercise (exercise_name, user_id, date, sets, reps, duration, weight, mode) VALUES ('Dumbell', 2, '2023-11-30', 2, 10, 0, 50, 'reps');

INSERT INTO equipment (equipment_id, equipment_name) VALUES (1,'Bench Press');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (2, 'Treadmill');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (3, 'Dumbell');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (4, 'Lat Pulldown');
INSERT INTO equipment (equipment_id, equipment_name) VALUES (5, 'Rowing Machine');

COMMIT TRANSACTION;
