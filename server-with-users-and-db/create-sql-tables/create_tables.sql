-- Creation of schools table
CREATE TABLE IF NOT EXISTS schools (
  school_id SERIAL NOT NULL,
  school_city VARCHAR NOT NULL,
  school_name varchar(50) NOT NULL,
  school_address VARCHAR(120),
  PRIMARY KEY (school_id)
);

INSERT INTO schools (school_city, school_name, school_address)
VALUES (');

-- Creation of teachers table
CREATE TABLE IF NOT EXISTS teachers (
  teacher_id SERIAL NOT NULL,
  teacher_name varchar(450) NOT NULL,
  PRIMARY KEY (teacher_id)
  CONSTRAINT fk_school
      FOREIGN KEY(school_id) 
	  REFERENCES schools(school_id)
);
