CREATE DATABASE database_assignment;
USE database_assignment;

-- Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    date_of_birth DATE
);

-- Clinics table
CREATE TABLE Clinics (
    clinic_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Appointments table
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    doctor_id INT,
    clinic_id INT,
    appointment_time DATETIME,
    status VARCHAR(20), -- 'scheduled' or 'cancelled'
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (clinic_id) REFERENCES Clinics(clinic_id)
);

-- Insert sample users
INSERT INTO Users (name, date_of_birth) VALUES 
('Rahul', '1990-06-25'),
('Raj', '1985-06-28'),
('Akash', '1992-07-01'),
('Ayush', '1988-06-30'),
('Akanksha', '1995-06-29'),
('Rohan', '1980-07-01'),
('Pooja', '1993-06-27'),
('Anjali', '1991-07-02'),
('Vikas', '1987-07-01'),
('Neha', '1994-06-30');

-- Insert sample clinics
INSERT INTO Clinics (name) VALUES 
('City Clinic'),
('Town Clinic'),
('Skyline Clinic'),
('Continental Clinic'),
('Central Clinic');

-- Insert sample doctors
INSERT INTO Doctors (name) VALUES 
('Dr. Amit'),
('Dr. Sneha'),
('Dr. Priya'),
('Dr. Suresh'),
('Dr. Kavita');

-- Insert sample appointments
INSERT INTO Appointments (user_id, doctor_id, clinic_id, appointment_time, status) VALUES 
(1, 1, 1, '2024-06-21 10:00:00', 'scheduled'),
(2, 1, 2, '2024-06-22 11:00:00', 'scheduled'),
(3, 2, 3, '2024-06-23 09:00:00', 'scheduled'),
(4, 2, 3, '2024-06-24 08:00:00', 'cancelled'),
(5, 3, 4, '2024-06-25 10:00:00', 'scheduled'),
(6, 3, 4, '2024-06-26 11:00:00', 'scheduled'),
(7, 4, 5, '2024-06-27 12:00:00', 'scheduled'),
(8, 4, 5, '2024-06-27 13:00:00', 'cancelled'),
(9, 5, 1, '2024-06-28 14:00:00', 'scheduled'),
(10, 5, 2, '2024-06-28 15:00:00', 'scheduled'),
(1, 1, 1, '2024-06-29 10:00:00', 'scheduled'),
(2, 2, 2, '2024-06-29 11:00:00', 'scheduled'),
(3, 3, 3, '2024-06-29 09:00:00', 'scheduled'),
(4, 4, 4, '2024-06-29 08:00:00', 'cancelled'),
(5, 5, 5, '2024-06-29 10:00:00', 'scheduled'),
(6, 1, 1, '2024-06-30 11:00:00', 'scheduled'),
(7, 2, 2, '2024-06-30 12:00:00', 'scheduled'),
(8, 3, 3, '2024-06-30 13:00:00', 'cancelled'),
(9, 4, 4, '2024-06-30 14:00:00', 'scheduled'),
(10, 5, 5, '2024-06-30 15:00:00', 'scheduled');

