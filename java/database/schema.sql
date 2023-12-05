BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, user_visits, exercise, equipment, exercise_details, exercise_equipment CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
	);

CREATE TABLE user_visits (
        user_visit_id SERIAL PRIMARY KEY,
        user_id INTEGER,
        check_in_date TIMESTAMP WITH TIME ZONE NOT NULL,
        check_out_date TIMESTAMP WITH TIME ZONE,
        duration INTERVAL,
        FOREIGN KEY (user_id) REFERENCES users(user_id)
    );
CREATE TABLE exercise (
    exercise_id SERIAL PRIMARY KEY,
    exercise_name varchar (50),
    user_id INT,
    date DATE,
    sets INT,
    reps INT,
    duration INT,
    weight DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE equipment (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(100)
);
-- rename to exercise_equipment as it is just a join for linking the exercise that uses equipment. move weight and reps to
--exercise table
CREATE TABLE exercise_equipment (
    exercise_id INT,
    equipment_id INT,
    PRIMARY KEY (exercise_id, equipment_id),
    FOREIGN KEY (exercise_id) REFERENCES exercise(exercise_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(equipment_id)
);

COMMIT TRANSACTION;