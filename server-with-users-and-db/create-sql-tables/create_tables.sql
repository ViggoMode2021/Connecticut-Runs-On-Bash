-- Creation of schools table
CREATE TABLE IF NOT EXISTS schools (
  school_id SERIAL NOT NULL,
  school_city VARCHAR NOT NULL,
  school_name varchar(50) NOT NULL,
  school_address VARCHAR(120),
  PRIMARY KEY (school_id)
);

INSERT INTO schools (school_city, school_name, school_address)
VALUES ('Bronx', 'Bronx 1', '339 Morris Ave, FL 2, Bronx, NY 10451, United States'),
       ('Bronx', 'Bronx 2', '450 St. Pauls Place, Floor 5, Bronx, NY 10456, United States'),
       ('Bronx', 'Bronx 3', '1000 Teller Ave, FL 4, Bronx, NY 10456, United States');

-- Creation of schools table
CREATE TABLE IF NOT EXISTS teachers (
  teacher_id SERIAL NOT NULL,
  teacher_name varchar(450) NOT NULL,
  PRIMARY KEY (teacher_id)
  CONSTRAINT fk_school
      FOREIGN KEY(school_id) 
	  REFERENCES schools(school_id)
);
