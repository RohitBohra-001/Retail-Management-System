 -- contains table creation statements

-- create the database
CREATE DATABASE IF NOT EXISTS online_retail_store;
USE online_retail_store;

-- create all the req tables
-- PRODUCTS TABLE
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    description TEXT,
    quantityInStock INT NOT NULL,
    supplierId INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_supplierId FOREIGN KEY (supplierId) REFERENCES suppliers(supplierId)
);

-- SUPPLIERS TABLE
CREATE TABLE suppliers(
    supplierId INT AUTO_INCREMENT PRIMARY KEY,
    supplierName VARCHAR(100) NOT NULL,
    supplierPhone VARCHAR(100) NOT NULL,
    supplierAddress VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- CUSTOMERS TABLE
CREATE TABLE customers(
    customerId INT AUTO_INCREMENT PRIMARY KEY,
    customerFirstName VARCHAR(100) NOT NULL,
    customerLastName VARCHAR(100) NOT NULL,
    customerEmail VARCHAR(100) NOT NULL,
    customerPhone VARCHAR(100) NOT NULL,
    customerAddress VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- EMPLOYEES TABLE
CREATE TABLE employees(
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    employeeFirstName VARCHAR(100) NOT NULL,
    employeeLastName VARCHAR(100) NOT NULL,
    employeeEmail VARCHAR(100) NOT NULL,
    employeePhone VARCHAR(100) NOT NULL,
    employeeAddress VARCHAR(100) NOT NULL,
    employeePosition VARCHAR(100) NOT NULL,
    employeeHireDate DATE NOT NULL,
    employeeSalary DECIMAL(10,2) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ORDERS TABLE
CREATE TABLE orders(
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    orderDate DATE NOT NULL,
    customerId INT,
    totalAmount DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'shipped', 'delivered') NOT NULL DEFAULT 'pending',
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_customerId FOREIGN KEY (customerId) REFERENCES customers(customerId),
);

-- ORDER_DETAILS TABLE
CREATE TABLE order_details(
    orderDetailId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_orderId FOREIGN KEY (orderId) REFERENCES orders(orderId),
    CONSTRAINT fk_productId FOREIGN KEY (productId) REFERENCES products(productId)
);