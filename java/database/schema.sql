BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_visits;

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
        check_in_date TIMESTAMP NOT NULL,
        check_out_date TIMESTAMP,
        duration INTERVAL,
        FOREIGN KEY (user_id) REFERENCES users(user_id)
    );

COMMIT TRANSACTION;
