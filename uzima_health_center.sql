 CREATE TABLE doctors(user_name VARCHAR(20),doctors_id INT,specialization VARCHAR (50),age INT, PRIMARY KEY (doctors_id));
Query OK, 0 rows affected (0.06 sec)

 CREATE TABLE patients (patient_id INT UNIQUE,first_name VARCHAR(15)  ,last_name VARCHAR(12),date_of_birth DATE,address VARCHAR (50),PRIMARY KEY (patient_id));
Query OK, 0 rows affected (0.06 sec)

 CREATE TABLE consultations (consultation_id INT AUTO_INCREMENT,doctors_id INT,patient_id INT,consultation_date DATE,notes TEXT,PRIMARY KEY (consultation_id),FOREIGN KEY (doctors_id) REFERENCES doctors(doctors_id),
 FOREIGN KEY (patient_id) REFERENCES patients(patient_id));
Query OK, 0 rows affected (0.06 sec)

       show tables;
+-------------------------------+
| Tables_in_uzima_health_center |
+-------------------------------+
| consultations                 |
| doctors                       |
| patients                      |
+-------------------------------+
3 rows in set (0.04 sec)


INSERT INTO doctors(user_name,doctors_id,specialization,age) VALUES('Dr. John Kibe',1,'Cardiology',40),
('Dr. Jane Kagwe',2,'Pediatrics',35),
('Dr. Mark Sugut',3,'Orthopedics',45);

INSERT INTO patients(patient_id,first_name,last_name,date_of_birth,address) VALUES(1,'Barbara','Kamau','2026-01-01','1532 ,Nairobi'),
(2,'Wayne','Limo','2026-05-05','4383 ,Nakuru'),
(3,'Martha','Simiyu','2025-12-10','78936 ,Eldoret');

INSERT INTO patients(patient_id,first_name,last_name,date_of_birth,address) VALUES(1,'Barbara','Kamau','2026-01-01','1532 ,Nairobi'),
(2,'Wayne','Limo','2026-05-05','4383 ,Nakuru'),
(3,'Martha','Simiyu','2025-12-10','78936 ,Eldoret');

INSERT INTO consultations(doctors_id,patient_id,consultation_date,notes) VALUES(1,1,'2025-05-15','Headache'),
(2,2,'2024-08-21','Cough'),
(3,3,'2026-04-10','Fever');

SELECT * FROM consultations;
+-------------+------------+------------+---------------+--------+
| consultation_id | doctors_id | patient_id | consultation_date | notes |
+-------------+------------+------------+---------------+--------+
|           1 |          1 |          1 | 2025-05-15 | Headache |
|           2 |          2 |          2 | 2024-08-21 | Cough |
|           3 |          3 |          3 | 2026-04-10 | Fever |
+-------------+------------+------------+---------------+--------+
3 rows in set (0.00 sec)

SELECT 
       consultation_id,
       doctors_id,
       patient_id,
       consultation_date,
       notes
FROM consultations
WHERE doctors_id = 1;
+-------------+------------+------------+---------------+--------+
| consultation_id | doctors_id | patient_id | consultation_date | notes |
+-------------+------------+------------+---------------+--------+
|           1 |          1 |          1 | 2025-05-15 | Headache |
+-------------+------------+------------+---------------+--------+
1 row in set (0.00 sec)