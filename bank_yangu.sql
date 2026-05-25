CREATE TABLE accounts(account_number INT,full_name VARCHAR(20),birth_date DATE ,
address VARCHAR(50),email VARCHAR(50),phone VARCHAR(12),national_id_number INT UNIQUE,PRIMARY KEY(account_number))
;

> CREATE TABLE transactions(transaction_id VARCHAR(6),amount INT ,account_number INT,
type ENUM('debit','credit'),PRIMARY KEY (transaction_id), FOREIGN KEY (account_number) REFERENCES accounts(account_number));

INSERT INTO accounts(account_number,full_name,birth_date,address,email,phone,national_id_number) VALUES(1,'John Doe','1990-01-01','123 Main St, Anytown, USA','j4lQZ@example.com','123-456-7890',123456789),
(2,'Jane Doe','1995-05-05','456 Main St, Anytown, USA','Y2E7J@example.com','987-654-3210',987654321);

INSERT INTO transactions(transaction_id,amount,account_number,type) VALUES('T001',1000,1,'credit'),
('T002',500,2,'debit');

INSERT INTO transactions(transaction_id,amount,account_number,type) VALUES('T003',2000,1,'credit'),
('T004',1000,2,'debit');

 CREATE TABLE consultations (consultation_id INT AUTO INCREMENT,doctor_id INT,patient_id INT,consultation_date DATE,notes TEXT,FOREIGN KEY (doctor_id) REFERENCE doctors(doctor_id),FOREIGN KEY (patient_id) REFERENCE patients(patient_id));

  CREATE TABLE consultations (consultation_id INT AUTO_INCREMENT,doctor_id INT,patient_id INT,consultation_date DATE,notes TEXT,FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),FOREIGN KEY (patient_id) REFERENCES patients(patient_id));