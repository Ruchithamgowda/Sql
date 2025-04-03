CREATE DATABASE my_furniture_info;
USE my_furniture_info
select * from furniture_info;

CREATE TABLE furniture_info (
    furniture_id INT PRIMARY KEY ,
    furniture_name VARCHAR(100) NOT NULL,
    furniture_type ENUM('Chair', 'Table', 'Sofa', 'Bed', 'Cupboard', 'Shelf') NOT NULL,
    material VARCHAR(50) NOT NULL,
    color VARCHAR(30),
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    manufacturer VARCHAR(100),
    warranty_period INT COMMENT 'Warranty in months',
    manufacture_date DATE
);

//NOT NULL
ALTER TABLE furniture_info 
MODIFY furniture_name VARCHAR(100) NOT NULL, 
MODIFY furniture_type ENUM('Chair', 'Table', 'Sofa', 'Bed', 'Cupboard', 'Shelf') NOT NULL, 
MODIFY material VARCHAR(50) NOT NULL, 
MODIFY price DECIMAL(10,2) NOT NULL, 
MODIFY quantity INT NOT NULL, 
MODIFY manufacture_date DATE NOT NULL;

// UNIQUE constraints
ALTER TABLE furniture_info 
ADD CONSTRAINT unique_furniture_name UNIQUE (furniture_name),
ADD CONSTRAINT unique_manufacture_date UNIQUE (manufacture_date);

// CHECK constraints
ALTER TABLE furniture_info 
ADD CONSTRAINT check_price_positive CHECK (price > 0),
ADD CONSTRAINT check_quantity_non_negative CHECK (quantity >= 0),
ADD CONSTRAINT check_warranty_period CHECK (warranty_period >= 0 AND warranty_period <= 120),
ADD CONSTRAINT check_valid_color CHECK (color IN ('Red', 'Blue', 'Black', 'White', 'Brown', 'Gray', 'Green'));

ALTER TABLE furniture_info DROP PRIMARY KEY;

ALTER TABLE furniture_info 
MODIFY furniture_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;


INSERT INTO furniture_info (furniture_name, furniture_type, material, color, price, quantity, manufacturer, warranty_period, manufacture_date)
VALUES 
('Elegant Chair', 'Chair', 'Wood', 'Brown', 1500.00, 10, 'WoodCrafters', 24, '2024-01-10'),
('Classic Table', 'Table', 'Metal', 'Black', 3200.00, 5, 'FurniTech', 36, '2023-12-15'),
('Luxury Sofa', 'Sofa', 'Leather', 'Gray', 12000.00, 2, 'Comfort Living', 60, '2024-02-20'),
('Modern Bed', 'Bed', 'Wood', 'White', 8000.00, 4, 'SleepWell', 48, '2024-01-25'),
('Office Cupboard', 'Cupboard', 'Metal', 'Gray', 5000.00, 6, 'SteelFurnish', 36, '2023-11-10'),
('Wall Shelf', 'Shelf', 'Plastic', 'White', 1200.00, 15, 'OrganizePro', 12, '2024-03-01'),
('Gaming Chair', 'Chair', 'Leather', 'Red', 8500.00, 8, 'GamerZone', 24, '2024-02-10'),
('Dining Table', 'Table', 'Glass', 'Brown', 7000.00, 3, 'GlassCraft', 36, '2024-02-05'),
('Recliner Sofa', 'Sofa', 'Fabric', 'Blue', 14000.00, 1, 'RelaxPlus', 72, '2024-01-30'),
('King Size Bed', 'Bed', 'Wood', 'Black', 10000.00, 2, 'LuxurySleep', 60, '2024-02-18'),
('Bookshelf', 'Shelf', 'Wood', 'Brown', 2500.00, 10, 'StudyBuddy', 24, '2024-03-05'),
('Steel Cupboard', 'Cupboard', 'Steel', 'Gray', 6000.00, 4, 'DurableFurni', 48, '2023-12-28'),
('Rocking Chair', 'Chair', 'Wood', 'White', 4500.00, 7, 'ComfortSeating', 30, '2024-01-22'),
('Coffee Table', 'Table', 'Wood', 'Black', 2800.00, 5, 'ElegantHomes', 24, '2024-02-12'),
('Storage Shelf', 'Shelf', 'Plastic', 'Green', 1800.00, 12, 'SmartOrganizers', 18, '2024-02-28');

ALTER TABLE furniture_info 
ADD COLUMN weight DECIMAL(6,2) NOT NULL COMMENT 'Weight in kg',
ADD COLUMN dimensions VARCHAR(50) NOT NULL COMMENT 'Dimensions (LxWxH in cm)';

UPDATE furniture_info SET weight = 12.5, dimensions = '45x45x90 cm' WHERE furniture_name = 'Elegant Chair';
UPDATE furniture_info SET weight = 25.0, dimensions = '120x60x75 cm' WHERE furniture_name = 'Classic Table';
UPDATE furniture_info SET weight = 40.0, dimensions = '200x90x100 cm' WHERE furniture_name = 'Luxury Sofa';
UPDATE furniture_info SET weight = 50.0, dimensions = '210x180x120 cm' WHERE furniture_name = 'Modern Bed';
UPDATE furniture_info SET weight = 35.0, dimensions = '100x50x180 cm' WHERE furniture_name = 'Office Cupboard';
UPDATE furniture_info SET weight = 8.0, dimensions = '90x30x120 cm' WHERE furniture_name = 'Wall Shelf';
UPDATE furniture_info SET weight = 15.5, dimensions = '70x70x120 cm' WHERE furniture_name = 'Gaming Chair';
UPDATE furniture_info SET weight = 30.0, dimensions = '150x80x75 cm' WHERE furniture_name = 'Dining Table';
UPDATE furniture_info SET weight = 45.0, dimensions = '190x85x100 cm' WHERE furniture_name = 'Recliner Sofa';
UPDATE furniture_info SET weight = 55.0, dimensions = '220x200x120 cm' WHERE furniture_name = 'King Size Bed';
UPDATE furniture_info SET weight = 10.0, dimensions = '90x30x180 cm' WHERE furniture_name = 'Bookshelf';
UPDATE furniture_info SET weight = 38.0, dimensions = '110x55x200 cm' WHERE furniture_name = 'Steel Cupboard';
UPDATE furniture_info SET weight = 12.0, dimensions = '60x60x100 cm' WHERE furniture_name = 'Rocking Chair';
UPDATE furniture_info SET weight = 22.0, dimensions = '90x50x45 cm' WHERE furniture_name = 'Coffee Table';
UPDATE furniture_info SET weight = 9.0, dimensions = '80x25x100 cm' WHERE furniture_name = 'Storage Shelf';