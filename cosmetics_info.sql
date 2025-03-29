CREATE DATABASE my_cosmetics_info;
USE my_cosmetics_info
SHOW DATABASES;
CREATE TABLE cosmetics_info (
    product_id INT PRIMARY KEY, 
    product_name VARCHAR(100) NOT NULL UNIQUE, 
    brand VARCHAR(50), 
    category VARCHAR(50), 
    price DECIMAL(10,2) NOT NULL, 
    stock_quantity INT NOT NULL, 
    rating DECIMAL(3,1), 
    expiry_date DATE, 
    status VARCHAR(20), 
    manufacturer VARCHAR(100)
);

SELECT * FROM cosmetics_info;

INSERT INTO cosmetics_info VALUES
(1, 'Lipstick', 'Maybelline', 'Makeup', 499.00, 120, 4.5, '2026-12-31', 'Available', 'L’Oreal'),
(2, 'Foundation', 'Lakme', 'Makeup', 799.00, 85, 4.3, '2025-11-30', 'Available', 'Unilever'),
(3, 'Eyeliner', 'Revlon', 'Makeup', 299.00, 150, 4.1, '2026-10-20', 'Available', 'Revlon Inc.'),
(4, 'Face Wash', 'Neutrogena', 'Skincare', 349.00, 100, 4.6, '2026-08-15', 'Available', 'Johnson & Johnson'),
(5, 'Moisturizer', 'Nivea', 'Skincare', 450.00, 200, 4.4, '2026-07-10', 'Available', 'Beiersdorf'),
(6, 'Shampoo', 'L’Oreal', 'Haircare', 599.00, 180, 4.2, '2026-09-05', 'Available', 'L’Oreal'),
(7, 'Conditioner', 'Tresemme', 'Haircare', 649.00, 90, 4.3, '2026-10-01', 'Available', 'Unilever'),
(8, 'Sunscreen', 'Lotus', 'Skincare', 499.00, 110, 4.5, '2025-12-30', 'Available', 'Lotus Herbals'),
(9, 'Nail Polish', 'Colorbar', 'Makeup', 250.00, 160, 4.0, '2026-06-15', 'Available', 'Colorbar Cosmetics'),
(10, 'Perfume', 'Calvin Klein', 'Fragrance', 2499.00, 70, 4.7, '2027-05-20', 'Available', 'Coty Inc.'),
(11, 'Hair Serum', 'L’Oreal', 'Haircare', 799.00, 95, 4.6, '2026-08-20', 'Available', 'L’Oreal'),
(12, 'BB Cream', 'Garnier', 'Makeup', 399.00, 140, 4.2, '2026-04-25', 'Available', 'L’Oreal'),
(13, 'Body Lotion', 'Vaseline', 'Skincare', 299.00, 130, 4.3, '2026-11-30', 'Available', 'Unilever'),
(14, 'Compact Powder', 'MAC', 'Makeup', 1999.00, 75, 4.7, '2026-10-15', 'Available', 'Estée Lauder'),
(15, 'Face Mask', 'The Body Shop', 'Skincare', 999.00, 60, 4.5, '2026-05-30', 'Available', 'Natura &Co'),
(16, 'Hair Oil', 'Dove', 'Haircare', 349.00, 110, 4.2, '2026-09-01', 'Available', 'Unilever'),
(17, 'Deodorant', 'Nivea', 'Fragrance', 275.00, 140, 4.1, '2026-12-05', 'Available', 'Beiersdorf'),
(18, 'Face Scrub', 'Himalaya', 'Skincare', 320.00, 150, 4.3, '2026-07-15', 'Available', 'Himalaya Herbals'),
(19, 'Hair Color', 'Godrej', 'Haircare', 299.00, 90, 4.2, '2026-10-10', 'Available', 'Godrej Consumer'),
(20, 'Lip Balm', 'Burt’s Bees', 'Skincare', 450.00, 170, 4.8, '2026-12-01', 'Available', 'Clorox');

ALTER TABLE cosmetics_info ADD COLUMN product_category VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE cosmetics_info  
SET product_category =  
    CASE  
        WHEN price >= 1500 THEN 'Luxury'  
        WHEN price >= 500 THEN 'Premium'  
        ELSE 'Affordable'  
    END;

SET SQL_SAFE_UPDATES = 1;

SELECT 
    COUNT(product_id) AS total_products,
    AVG(price) AS avg_price,
    SUM(stock_quantity) AS total_stock,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM cosmetics_info;

SELECT category, COUNT(product_id) AS product_count, AVG(rating) AS avg_rating
FROM cosmetics_info
GROUP BY category
HAVING COUNT(product_id) > 2; 