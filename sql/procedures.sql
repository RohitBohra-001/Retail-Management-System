-- stored procedures and functions

USE online_retail_store;
DELIMITER //

-- Procedure to add an order and update product stock accordingly
CREATE PROCEDURE AddOrder (
    IN p_customer_id INT,
    IN p_order_date DATE,
    IN p_total_amount DECIMAL(10,2),
    IN p_product_id INT,
    IN p_quantity INT,
    IN p_price DECIMAL(10,2)
)
BEGIN
    -- Insert new order
    INSERT INTO orders (customer_id, order_date, total_amount, status)
    VALUES (p_customer_id, p_order_date, p_total_amount, 'Pending');
    
    -- Get the last inserted order id
    DECLARE last_order INT;
    SET last_order = LAST_INSERT_ID();
    
    -- Insert order details
    INSERT INTO order_details (order_id, product_id, quantity, price)
    VALUES (last_order, p_product_id, p_quantity, p_price);
    
    -- Update product stock (reduce stock)
    UPDATE products
    SET quantity_in_stock = quantity_in_stock - p_quantity
    WHERE product_id = p_product_id;
END //
DELIMITER ;
