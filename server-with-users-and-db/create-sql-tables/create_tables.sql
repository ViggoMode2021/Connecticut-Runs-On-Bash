-- Creation of schools table
CREATE TABLE IF NOT EXISTS schools (
  school_id SERIAL NOT NULL,
  school_city VARCHAR NOT NULL,
  school_name varchar(50) NOT NULL,
  school_address VARCHAR(120),
  school_phone VARCHAR(20),
  PRIMARY KEY (school_id)
);

INSERT INTO schools (school_city, school_name, school_address, school_phone)
VALUES ('Bronx', 'Bronx 1 Middle School', '339 Morris Ave, FL 2, Bronx, NY 10451, United States'),
       ('Bronx', 'Bronx 1', '339 Morris Ave, FL 2, Bronx, NY 10451, United States'),
       ('Bronx', 'Bronx 2 Middle School', '270 East 167 Street, Floor 2, Bronx, NY 10456', '646-558-0038'),
       ('Bronx', 'Bronx 2', '450 St. Pauls Place, Floor 5, Bronx, NY 10456, United States'),
       ('Bronx', 'Bronx 3', '1000 Teller Ave, FL 4, Bronx, NY 10456, United States'),
       ('Bronx', 'Bronx 4', '1000 Teller Ave, FL 4, Bronx, NY 10456, United States', '646-558-0043'),
       ('Bronx', 'Bronx 5 Lower', '604 East 139th Street, Bronx, NY 10454 Bronx, NY, 10454', '347-284-6465'),
       ('Bronx', 'Bronx 5 Upper', '450 St. Pauls Place, Floor 5, Bronx, NY 10456, United States'),
       ('Bronx', 'Bronx Middle School', '965 Longwood Avenue, Floor 2 Bronx, NY 10459', '347-329-3360'),
       ('Bronx', 'Bronx 4', '1000 Teller Ave, FL 4, Bronx, NY 10456, United States', '646-558-0043'),
       ('Bronx', 'Bronx 5 Lower', '604 East 139th Street, Bronx, NY 10454 Bronx, NY, 10454', '347-284-6465'),
       ('Brooklyn', 'Bed-Stuy 1', '211 Throop Avenue, Floor 3, Brooklyn, NY 11206', '718-704-1439'),
       ('Brooklyn', 'Bed-Stuy Middle School', '70 Tompkins Avenue, Floor 2 Brooklyn, NY 11206', '718-635-3294'),
       ('Brooklyn', 'Bergen Beach', '1420 East 68th Street, Floor 3, Brooklyn, NY 11234', '347-817-2017'),
       ('Brooklyn', 'Bushwick', '139 Menahan Street, Brooklyn, NY 11221', '646-790-2173'),
       ('Brooklyn', 'Cobble Hill', '284 Baltic Street, Lower Level, Brooklyn, NY 11201', '718-704-1460'),
       ('Brooklyn', 'Crown Heights', '330 Crown Street, Floor 5, Brooklyn, NY 11225', '646-790-2129'),
       ('Brooklyn', 'Ditmas Park Middle School', '72 Veronica Place, Floor 3, Brooklyn, NY 11226', '718-704-1464'),
       ('Brooklyn', 'East Flatbush Middle School', '3109 Newkirk Avenue, Brooklyn, NY 11226', '718-395-6345'),
       ('Brooklyn', 'Flatbush', '15 Snyder Avenue, Brooklyn, NY 11226', '646-790-2150'),
       ('Brooklyn', 'Crown Heights', '330 Crown Street, Floor 5, Brooklyn, NY 11225', '646-790-2129'),
       ('Brooklyn', 'Ditmas Park Middle School', '72 Veronica Place, Floor 3, Brooklyn, NY 11226', '718-704-1464'),
       ('Brooklyn', 'East Flatbush Middle School', '3109 Newkirk Avenue, Brooklyn, NY 11226', '718-395-6345'),
       ('Brooklyn', 'Lafayette Middle School', '787 Lafayette Avenue, Brooklyn, NY 11221', '646-790-2126'),
       ('Brooklyn', 'Myrtle Middle School', '700 Park Avenue, Floor 3, Brooklyn, NY 11206', '646-569-5914'),
       ('Brooklyn', 'Prospect Heights', '801 Park Place, Floor 4, Brooklyn, NY 11216', '646-790-2121'),
       ('Brooklyn', 'Sheepshead Bay', '3000 Avenue X Brooklyn, NY 11235', '*Pending Government Approval'),
       ('Brooklyn', 'Williamsburg', '183 South 3rd Street, Floor 4, Brooklyn, NY 11211', '718-704-1419'),
       
       

-- Creation of teachers table
CREATE TABLE IF NOT EXISTS teachers (
  teacher_id SERIAL NOT NULL,
  teacher_name varchar(450) NOT NULL,
  PRIMARY KEY (teacher_id)
  CONSTRAINT fk_school
      FOREIGN KEY(school_id) 
	  REFERENCES schools(school_id)
);
