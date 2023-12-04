BEGIN TRANSACTION;
DROP TABLE IF EXISTS users, user_visits CASCADE;

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
INSERT INTO users (username,password_hash,role) VALUES ('user1','user1','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user2','user2','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('user3','user3','ROLE_USER');

-- Example 1: User checked in and checked out
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration)
VALUES
  (1, '2023-01-01 08:00:00'::TIMESTAMP WITH TIME ZONE, '2023-01-01 17:00:00'::TIMESTAMP WITH TIME ZONE, '09:00:00'::INTERVAL);

-- Example 2: User checked in but has not checked out yet
INSERT INTO user_visits (user_id, check_in_date)
VALUES
  (2, '2023-01-02 10:30:00'::TIMESTAMP WITH TIME ZONE);

-- Example 3: User checked in and checked out with a different duration
INSERT INTO user_visits (user_id, check_in_date, check_out_date, duration)
VALUES
  (3, '2023-01-03 12:45:00'::TIMESTAMP WITH TIME ZONE, '2023-01-03 16:30:00'::TIMESTAMP WITH TIME ZONE, '03:45:00'::INTERVAL);

---- Example 4: User checked in without checking out (ongoing visit)
--INSERT INTO user_visits (user_id, check_in_date)
--VALUES
--  (4, '2023-01-04 14:00:00'::TIMESTAMP WITH TIME ZONE);


COMMIT TRANSACTION;
