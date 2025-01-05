


CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15),
    car_id INT,
    FOREIGN KEY (car_id) REFERENCES cars(car_id)
    );
    
    CREATE TABLE cars (
    car_id INT PRIMARY KEY,
    model VARCHAR(100),
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

CREATE TABLE clients (
    clients_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE Маршрут (
    route_id INT PRIMARY KEY,
    start_location VARCHAR(255),
    end_location VARCHAR(255),
    distance DECIMAL(5, 2)
);

CREATE TABLE Платеж (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    payment_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    client_id INT,
    driver_id INT,
    route_id INT,
    payment_id INT,
    order_date DATE,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (route_id) REFERENCES Маршрут(route_id),
    FOREIGN KEY (payment_id) REFERENCES Платеж(payment_id)
);