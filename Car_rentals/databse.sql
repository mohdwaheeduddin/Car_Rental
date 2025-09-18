use  car_rental;

create table user(user_id int primary key,firstname varchar(20) not null,lastname varchar(20) not null,password varchar(20) not null,email varchar(20),
phone int not null);

create table admin( admin_id int primary key ,firstname varchar(20) not null,lastname varchar(20) not null,password varchar(20) not null,email varchar(20),phone int not null);

create table cars(car_id int primary key,cname varchar(20) not null,specifications varchar(20) not null,model varchar(20) not null,variant varchar(20),cost_perday int not null);

create table bookings (sno int primary key,user_id int ,foreign key(user_id) references user(user_id),car_id int ,foreign key(car_id) references cars(car_id),days int not null,from_date date,to_date date,license_no int not null);

CREATE TABLE login (
    
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL
   );
select * from user;

drop table user;
drop table cars;
drop table admin;
drop table bookings;

ALTER TABLE user MODIFY phone   varchar(20);
alter table user modify email varchar(50);
/*************************************************************************************************************/

-- USER TABLE
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(20),
    phone BIGINT NOT NULL 
);

-- ADMIN TABLE
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    email VARCHAR(20),
    phone BIGINT NOT NULL
);

-- CARS TABLE
CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    cname VARCHAR(20) NOT NULL,
    specifications VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL,
    variant VARCHAR(20),
    cost_perday varchar(30) NOT NULL,
    carimage varchar(50) 
);

-- BOOKINGS TABLE
CREATE TABLE bookings (
    sno INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    car_id INT,
    days INT NOT NULL,
    from_date DATE,
    to_date DATE,
    license_no VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
);


INSERT INTO cars (cname, specifications, model, variant, cost_perday,carimage) VALUES
('Maruti Swift', 'Hatchback', '2022', 'Petrol Manual', 2800,'maruti.jpeg'),
('Hyundai Creta', 'SUV', '2023', 'Diesel Manual', 4200,'creata.jpeg'),
('Tata Nexon', 'Compact SUV', '2023', 'Petrol Manual', 3500,'nexon.jpeg'),
('Kia Seltos', 'SUV', '2023', 'Petrol CVT', 4600,'seltos.jpeg'),
('Mahindra Thar', 'SUV', '2022', 'Diesel Manual', 5000,'thar.jpeg'),
('Toyota Innova', 'MPV', '2023', 'Diesel Automatic', 4800,'innova.jpeg'),
('Honda Amaze', 'Sedan', '2022', 'Petrol Manual', 2600,'amaze.jpeg'),
('Renault Kwid', 'Hatchback', '2023', 'Petrol Manual', 2000,'kwid.jpeg'),
('Skoda Slavia', 'Sedan', '2023', 'Petrol Automatic', 4400,'slavia.jpeg'),
('Volkswagen Taigun', 'SUV', '2023', 'Petrol Manual', 4700,'taigun.jpeg');

INSERT INTO cars (cname, specifications, model, variant, cost_perday,carimage) VALUES
('Tata Punch', 'Micro SUV', '2023', 'Petrol Manual', 3000,'punch.jpeg'),
('Maruti Ertiga', 'MPV', '2023', 'CNG Manual', 3200,'ertiga.jpeg'),
('Hyundai Venue', 'Compact SUV', '2023', 'Diesel Manual', 3800,'venue.jpeg'),
('Kia Carens', 'MPV', '2023', 'Petrol Manual', 4000,'carens.jpeg'),
('MG Astor', 'SUV', '2023', 'Petrol CVT', 4700,'astor.jpeg'),
('Toyota Glanza', 'Hatchback', '2023', 'Petrol Manual', 2500,'glanza.jpeg'),
('Honda City', 'Sedan', '2022', 'Petrol CVT', 4600,'city.jpeg'),
('Mahindra XUV300', 'SUV', '2023', 'Diesel Manual', 4100,'xuv.jpeg'),
('Renault Triber', 'MPV', '2023', 'Petrol Manual', 2800,'triber.jpeg'),
('Hyundai i20', 'Hatchback', '2023', 'Petrol Manual', 2700,'i20.jpeg');

select * from cars;
select * from bookings;
select * from user;
