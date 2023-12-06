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



COMMIT TRANSACTION;
