-- sample data insertion scripts

USE online_retail_store;

-- Insert sample suppliers
INSERT INTO suppliers (name, contact_name, phone, address)
VALUES 
('Supplier A', 'Alice', '123-456-7890', '123 A Street'),
('Supplier B', 'Bob', '234-567-8901', '456 B Avenue'),
('Supplier C', 'Charlie', '345-678-9012', '789 C Road'),
('Supplier D', 'Dana', '456-789-0123', '101 D Blvd'),
('Supplier E', 'Evan', '567-890-1234', '202 E Lane'),
('Supplier F', 'Fiona', '678-901-2345', '303 F Street'),
('Supplier G', 'George', '789-012-3456', '404 G Plaza'),
('Supplier H', 'Hannah', '890-123-4567', '505 H Drive'),
('Supplier I', 'Ivan', '901-234-5678', '606 I Court'),
('Supplier J', 'Julia', '012-345-6789', '707 J Circle');

-- Insert sample products (using supplier_ids from above)
INSERT INTO products (name, description, price, quantity_in_stock, supplier_id)
VALUES 
('Laptop', 'High performance laptop', 1200.00, 50, 1),
('Smartphone', 'Latest model smartphone', 800.00, 100, 2),
('Headphones', 'Noise-cancelling headphones', 150.00, 200, 3),
('Keyboard', 'Mechanical keyboard', 80.00, 150, 4),
('Mouse', 'Wireless mouse', 40.00, 300, 5),
('Monitor', '27 inch monitor', 300.00, 75, 6),
('Printer', 'All-in-one printer', 200.00, 60, 7),
('Desk Lamp', 'LED desk lamp', 30.00, 120, 8),
('USB Cable', 'Fast charging USB cable', 10.00, 500, 9),
('External HDD', '1TB external hard drive', 100.00, 80, 10);

-- Insert sample customers
INSERT INTO customers (first_name, last_name, email, phone, address)
VALUES 
('John', 'Doe', 'john.doe@example.com', '555-1234', '12 Main St'),
('Jane', 'Smith', 'jane.smith@example.com', '555-2345', '34 Elm St'),
('Jim', 'Beam', 'jim.beam@example.com', '555-3456', '56 Oak St'),
('Jill', 'Valentine', 'jill.valentine@example.com', '555-4567', '78 Pine St'),
('Jack', 'Daniels', 'jack.daniels@example.com', '555-5678', '90 Maple St'),
('Jenny', 'Lee', 'jenny.lee@example.com', '555-6789', '101 Birch St'),
('Jerry', 'Seinfeld', 'jerry.seinfeld@example.com', '555-7890', '202 Cedar St'),
('Jessica', 'Jones', 'jessica.jones@example.com', '555-8901', '303 Walnut St'),
('Jordan', 'Belfort', 'jordan.belfort@example.com', '555-9012', '404 Spruce St'),
('Jasmine', 'Rice', 'jasmine.rice@example.com', '555-0123', '505 Cherry St');

-- Insert sample employees
INSERT INTO employees (first_name, last_name, email, position, hire_date)
VALUES
('Emily', 'Clark', 'emily.clark@example.com', 'Manager', '2019-01-15'),
('Michael', 'Brown', 'michael.brown@example.com', 'Sales Associate', '2020-03-22'),
('Sarah', 'Davis', 'sarah.davis@example.com', 'Inventory Specialist', '2018-07-10'),
('David', 'Wilson', 'david.wilson@example.com', 'Customer Service', '2021-05-05'),
('Laura', 'Miller', 'laura.miller@example.com', 'Cashier', '2020-11-30'),
('Daniel', 'Garcia', 'daniel.garcia@example.com', 'Warehouse Staff', '2019-09-14'),
('Olivia', 'Martinez', 'olivia.martinez@example.com', 'Marketing Specialist', '2021-02-18'),
('James', 'Robinson', 'james.robinson@example.com', 'IT Support', '2017-12-01'),
('Sophia', 'Lopez', 'sophia.lopez@example.com', 'HR', '2020-06-25'),
('William', 'Anderson', 'william.anderson@example.com', 'Logistics Coordinator', '2018-04-12');

-- Insert sample orders
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2023-02-10', 1500.00, 'Completed'),
(2, '2023-02-11', 800.00, 'Completed'),
(3, '2023-02-12', 300.00, 'Pending'),
(4, '2023-02-13', 200.00, 'Completed'),
(5, '2023-02-14', 400.00, 'Pending'),
(6, '2023-02-15', 600.00, 'Completed'),
(7, '2023-02-16', 750.00, 'Pending'),
(8, '2023-02-17', 1200.00, 'Completed'),
(9, '2023-02-18', 450.00, 'Pending'),
(10, '2023-02-19', 500.00, 'Completed');

-- Insert sample order details (simulate orders with multiple products)
INSERT INTO order_details (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1200.00),
(1, 3, 2, 150.00),
(2, 2, 1, 800.00),
(3, 4, 3, 80.00),
(4, 5, 4, 40.00),
(5, 6, 2, 300.00),
(6, 7, 1, 200.00),
(7, 8, 5, 30.00),
(8, 9, 10, 10.00),
(9, 10, 1, 100.00),
(10, 1, 1, 1200.00);
