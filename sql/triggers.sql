-- triggers for automation

USE online_retail_store;
DELIMITER //

-- Trigger to log stock when a new product is inserted
CREATE TRIGGER trg_insert_product_stock
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO stock_changes (product_id, old_quantity, new_quantity, event_type)
    VALUES (NEW.product_id, NULL, NEW.quantity_in_stock, 'INSERT');
END //

DELIMITER ;

DELIMITER //

-- Trigger to log changes when an existing product's stock is updated
CREATE TRIGGER trg_update_product_stock
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO stock_changes (product_id, old_quantity, new_quantity, event_type)
    VALUES (OLD.product_id, OLD.quantity_in_stock, NEW.quantity_in_stock, 'UPDATE');
END //

DELIMITER ;


