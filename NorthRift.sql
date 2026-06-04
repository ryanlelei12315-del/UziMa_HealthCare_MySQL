
CREATE TABLE NorthRift (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    difficulty_level INT,
    driver_id INT,
    vehicle_id INT,
    trip_id INT,
    FOREIGN KEY (trip_id) REFERENCES TRIPS(id),
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLES(id),
    FOREIGN KEY (driver_id) REFERENCES DRIVERS(id)
);
CREATE TABLE DRIVERS (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    license_number VARCHAR(50) UNIQUE,
    phone_number VARCHAR(20)
);
CREATE TABLE VEHICLES (
    id INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES DRIVERS(id)
);

CREATE TABLE TRIPS (
    id INT PRIMARY KEY,
    driver_id INT,
    vehicle_id INT,
    start_location VARCHAR(255),
    end_location VARCHAR(255),
    trip_date DATE,
    FOREIGN KEY (driver_id) REFERENCES DRIVERS(id),
    FOREIGN KEY (vehicle_id) REFERENCES VEHICLES(id)
);
CREATE TABLE BOOKINGS (
    id INT PRIMARY KEY,
    trip_id INT,
    customer_name VARCHAR(255),
    customer_contact VARCHAR(255),
    booking_date DATE,
    FOREIGN KEY (trip_id) REFERENCES TRIPS(id)
);
CREATE TABLE PAYMENTS (
    id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES BOOKINGS(id)
);
CREATE TABLE parcels (
    id INT PRIMARY KEY,
    sender_name VARCHAR(255),
    recipient_name VARCHAR(255),
    origin VARCHAR(255),
    destination VARCHAR(255),
    parcel_type VARCHAR(255),
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES DRIVERS(id),
    weight DECIMAL(10, 2),
    status VARCHAR(50)
);
CREATE TABLE FEEDBACK (
    id INT PRIMARY KEY,
    trip_id INT,
    rating INT,
    comments TEXT,
    FOREIGN KEY (trip_id) REFERENCES TRIPS(id)
);
INSERT INTO NorthRift (id, name, description, location, difficulty_level) VALUES
(1, 'Mount Elgon', 'A dormant shield volcano on the border of Uganda and Kenya.', 'Kenya/Uganda', 4),
(2, 'Sibiloi National Park', 'A UNESCO World Heritage Site known for its rich fossil beds.', 'Kenya', 3),
(3, 'Lake Turkana', "The world's largest permanent desert lake.", 'Kenya', 5),
(4, 'Marsabit National Park', 'A park with diverse wildlife and unique landscapes.', 'Kenya', 3),
(5, 'Kakuma Refugee Camp', 'One of the largest refugee camps in the world.', 'Kenya', 2);
INSERT INTO DRIVERS (id, name, license_number, phone_number) VALUES
(1, 'John Doe', 'ABC12345', '555-1234'),
(2, 'Jane Smith', 'XYZ67890', '555-5678'),
(3, 'Mike Johnson', 'LMN54321', '555-9012');
INSERT INTO VEHICLES (id, make, model, year, driver_id) VALUES
(1, 'Toyota', 'Land Cruiser', 2020, 1),
(2, 'Ford', 'Ranger', 2019, 2),
(3, 'Nissan', 'Navara', 2021, 3);
INSERT INTO TRIPS (id, driver_id, vehicle_id, start_location, end_location, trip_date) VALUES
(1, 1, 1, 'Nairobi', 'Mount Elgon', '2024-07-01'),
(2, 2, 2, 'Nairobi', 'Sibiloi National Park', '2024-07-02'),
(3, 3, 3, 'Nairobi', 'Lake Turkana', '2024-07-03');
INSERT INTO BOOKINGS (id, trip_id, customer_name, customer_contact, booking_date) VALUES
(1, 1, 'Alice Brown', '555-9876', '2024-06-30'),
(2, 2, 'Bob Green', '555-6543', '2024-06-29'),
(3, 3, 'Charlie White', '555-3210', '2024-06-28');

