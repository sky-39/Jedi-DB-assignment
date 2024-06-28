-- 1. All appointments booked in last 7 days for a doctor
SELECT * FROM Appointments
WHERE doctor_id = 1
AND appointment_time >= NOW() - INTERVAL 7 DAY;

  
-- 2. All appointments booked in last 2 days and scheduled within next 5 hours for a doctor
SELECT * FROM Appointments
WHERE doctor_id = 1
AND appointment_time >= NOW() - INTERVAL 2 DAY
AND appointment_time <= NOW() + INTERVAL 5 HOUR;


-- 3. Users who have at least 1 appointment and have their birthday coming in next 5 days
SELECT DISTINCT u.* FROM Users u
JOIN Appointments a ON u.user_id = a.user_id
WHERE a.appointment_time >= NOW() - INTERVAL 7 DAY
AND DATE_ADD(u.date_of_birth, INTERVAL YEAR(CURDATE()) - YEAR(u.date_of_birth) + 
IF(DAYOFYEAR(CURDATE()) <= DAYOFYEAR(u.date_of_birth), 0, 1) YEAR) 
BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 5 DAY);


-- 4. Appointments for a particular patient in the last 7 days
SELECT * FROM Appointments
WHERE user_id = 1
AND appointment_time >= NOW() - INTERVAL 7 DAY;


-- 5. Appointment cancellation percentage for a doctor by clinic
SELECT c.name AS clinic_name, 
       d.name AS doctor_name, 
       COUNT(CASE WHEN a.status = 'cancelled' THEN 1 END) * 100.0 / COUNT(*) AS cancellation_percentage
FROM Appointments a
JOIN Clinics c ON a.clinic_id = c.clinic_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.doctor_id = 1
GROUP BY c.name, d.name;
