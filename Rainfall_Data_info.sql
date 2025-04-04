CREATE DATABASE my_Rainfall_Data_info;
CREATE DATABASE my_Real_Estate_Listings_info;
CREATE DATABASE my_Pharmacy_Inventory_info;
CREATE DATABASE my_Projects_Info;
CREATE DATABASE my_Warehouse_Stock_info;
USE my_Rainfall_Data_info
USE my_Real_Estate_Listings_info
USE my_Pharmacy_Inventory_info
USE my_Projects_Info
USE my_Warehouse_Stock_info
select * from Rainfall_Data_info;
select * from Real_Estate_Listings_info;
select * from Pharmacy_Inventory_info;
select * from Projects_Info;
select * from Warehouse_Stock_info;

CREATE TABLE Rainfall_Data_info (
    region_id INT NOT NULL PRIMARY KEY,
    region VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    month VARCHAR(20),
    total_rainfall_mm DECIMAL(10,2) CHECK (total_rainfall_mm >= 0),
    average_rainfall_mm DECIMAL(10,2),
    rainy_days INT,
    max_rainfall_day DECIMAL(10,2),
    min_rainfall_day DECIMAL(10,2),
    humidity_percentage DECIMAL(5,2)
);

CREATE TABLE Real_Estate_Listings_info (
    property_id INT NOT NULL PRIMARY KEY,
    region_id INT NOT NULL,
    location VARCHAR(255),
    price DECIMAL(15,2) CHECK (price > 0),
    property_type VARCHAR(100),
    area_sqft DECIMAL(10,2),
    bedrooms INT,
    bathrooms INT,
    year_built INT,
    listing_status VARCHAR(50),
    agent_contact VARCHAR(100),
    FOREIGN KEY (region_id) REFERENCES Rainfall_Data_info(region_id)
);

CREATE TABLE Pharmacy_Inventory_info (
    medicine_id INT NOT NULL PRIMARY KEY,
    region_id INT NOT NULL,
    property_id INT NOT NULL,
    medicine_name VARCHAR(255),
    category VARCHAR(100),
    quantity_available INT CHECK (quantity_available >= 0),
    price_per_unit DECIMAL(10,2),
    manufacturer VARCHAR(255),
    expiry_date DATE,
    storage_condition VARCHAR(100),
    FOREIGN KEY (region_id) REFERENCES Rainfall_Data_info(region_id),
    FOREIGN KEY (property_id) REFERENCES Real_Estate_Listings_info(property_id)
);

CREATE TABLE Projects_Info (
    project_id INT NOT NULL PRIMARY KEY,
    region_id INT NOT NULL,
    property_id INT NOT NULL,
    medicine_id INT NOT NULL,
    project_name VARCHAR(255),
    client_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15,2) CHECK (budget >= 0),
    project_manager VARCHAR(255),
    team_size INT,
    FOREIGN KEY (region_id) REFERENCES Rainfall_Data_info(region_id),
    FOREIGN KEY (property_id) REFERENCES Real_Estate_Listings_info(property_id),
    FOREIGN KEY (medicine_id) REFERENCES Pharmacy_Inventory_info(medicine_id)
);

CREATE TABLE Warehouse_Stock_info (
    item_id INT NOT NULL PRIMARY KEY,
    region_id INT NOT NULL,
    property_id INT NOT NULL,
    medicine_id INT NOT NULL,
    project_id INT NOT NULL,
    item_name VARCHAR(255),
    category VARCHAR(100),
    quantity_in_stock INT CHECK (quantity_in_stock >= 0),
    price_per_unit DECIMAL(10,2),
    supplier_name VARCHAR(255),
    FOREIGN KEY (region_id) REFERENCES Rainfall_Data_info(region_id),
    FOREIGN KEY (property_id) REFERENCES Real_Estate_Listings_info(property_id),
    FOREIGN KEY (medicine_id) REFERENCES Pharmacy_Inventory_info(medicine_id),
    FOREIGN KEY (project_id) REFERENCES Projects_Info(project_id)
);

INSERT INTO Rainfall_Data_info (region_id, region, year, month, total_rainfall_mm, average_rainfall_mm, rainy_days, max_rainfall_day, min_rainfall_day, humidity_percentage) VALUES
(1, 'New York', 2024, 'January', 120.5, 10.5, 12, 25.4, 2.3, 80.2),
(2, 'Los Angeles', 2024, 'February', 98.2, 8.2, 10, 22.1, 1.5, 75.4),
(3, 'Chicago', 2024, 'March', 150.0, 12.5, 15, 30.2, 3.0, 82.1),
(4, 'Houston', 2024, 'April', 80.4, 6.7, 9, 18.5, 1.8, 70.0),
(5, 'Phoenix', 2024, 'May', 110.3, 9.2, 11, 24.7, 2.1, 78.9),
(6, 'San Diego', 2024, 'June', 200.5, 16.7, 18, 40.3, 5.5, 85.4),
(7, 'Dallas', 2024, 'July', 250.7, 20.9, 21, 50.0, 6.0, 88.2),
(8, 'San Francisco', 2024, 'August', 180.9, 15.1, 16, 36.4, 4.2, 83.7),
(9, 'Seattle', 2024, 'September', 90.2, 7.5, 10, 20.5, 2.0, 74.5),
(10, 'Denver', 2024, 'October', 130.8, 10.9, 13, 28.3, 2.9, 79.8),
(11, 'Boston', 2024, 'November', 140.1, 11.7, 14, 30.0, 3.2, 81.5),
(12, 'Atlanta', 2024, 'December', 70.5, 5.9, 8, 15.7, 1.3, 69.1),
(13, 'Miami', 2024, 'January', 125.3, 10.8, 12, 27.0, 2.6, 80.0),
(14, 'Las Vegas', 2024, 'February', 105.7, 9.0, 11, 23.5, 2.0, 76.8),
(15, 'Detroit', 2024, 'March', 160.2, 13.3, 16, 33.0, 3.5, 84.2),
(16, 'Austin', 2024, 'April', 75.9, 6.3, 8, 16.2, 1.7, 71.3),
(17, 'Philadelphia', 2024, 'May', 115.4, 9.6, 11, 25.9, 2.2, 79.5),
(18, 'Minneapolis', 2024, 'June', 195.8, 16.3, 17, 39.1, 5.2, 84.8),
(19, 'Portland', 2024, 'July', 245.1, 20.4, 21, 49.3, 5.8, 87.6),
(20, 'San Antonio', 2024, 'August', 185.3, 15.4, 17, 37.2, 4.5, 83.9);

SELECT property_id FROM Real_Estate_Listings_info;

INSERT INTO Real_Estate_Listings_info (property_id, region_id, location, price, property_type, area_sqft, bedrooms, bathrooms, year_built, listing_status, agent_contact) VALUES
(1, 1, 'Downtown', 500000, 'Apartment', 1200, 3, 2, 2015, 'Available', 'Agent A'),
(2, 2, 'Hollywood', 750000, 'Villa', 2000, 4, 3, 2018, 'Sold', 'Agent B'),
(3, 3, 'Magnificent Mile', 600000, 'Apartment', 1300, 3, 2, 2016, 'Available', 'Agent C'),
(4, 4, 'Uptown', 850000, 'House', 2200, 5, 3, 2019, 'Pending', 'Agent D'),
(5, 5, 'Suburbs', 450000, 'Apartment', 1100, 2, 2, 2014, 'Available', 'Agent E'),
(6, 6, 'Hillcrest', 950000, 'House', 2500, 5, 4, 2020, 'Sold', 'Agent F'),
(7, 7, 'Deep Ellum', 700000, 'Villa', 1800, 4, 3, 2017, 'Available', 'Agent G'),
(8, 8, 'Mission Bay', 500000, 'Apartment', 1250, 3, 2, 2015, 'Pending', 'Agent H'),
(9, 9, 'Capitol Hill', 650000, 'House', 2000, 4, 3, 2019, 'Available', 'Agent I'),
(10, 10, 'LoDo', 800000, 'Villa', 2300, 5, 4, 2021, 'Sold', 'Agent J'),
(11, 11, 'Beacon Hill', 550000, 'Apartment', 1300, 3, 2, 2016, 'Available', 'Agent K'),
(12, 12, 'Buckhead', 870000, 'House', 2400, 5, 4, 2020, 'Pending', 'Agent L'),
(13, 13, 'Brickell', 480000, 'Apartment', 1150, 2, 2, 2013, 'Available', 'Agent M'),
(14, 14, 'Summerlin', 690000, 'Villa', 1900, 4, 3, 2018, 'Sold', 'Agent N'),
(15, 15, 'Greektown', 530000, 'Apartment', 1250, 3, 2, 2015, 'Available', 'Agent O'),
(16, 16, 'Zilker', 920000, 'House', 2600, 5, 4, 2022, 'Pending', 'Agent P'),
(17, 17, 'University City', 580000, 'Apartment', 1350, 3, 2, 2017, 'Available', 'Agent Q'),
(18, 18, 'North Loop', 750000, 'Villa', 2100, 4, 3, 2020, 'Sold', 'Agent R'),
(19, 19, 'Pearl District', 470000, 'Apartment', 1100, 2, 2, 2014, 'Available', 'Agent S'),
(20, 20, 'Alamo Heights', 820000, 'House', 2500, 5, 4, 2023, 'Sold', 'Agent T');

INSERT INTO Pharmacy_Inventory_info (medicine_id, region_id, property_id, medicine_name, category, quantity_available, price_per_unit, manufacturer, expiry_date, storage_condition)  
VALUES 
(1, 1, 1, 'Paracetamol', 'Painkiller', 500, 2.50, 'PharmaCorp', '2026-12-01', 'Cool & Dry'), 
(2, 2, 2, 'Ibuprofen', 'Painkiller', 300, 3.00, 'MediHealth', '2025-10-15', 'Room Temperature'), 
(3, 3, 3, 'Aspirin', 'Painkiller', 400, 1.80, 'PharmaCorp', '2027-08-30', 'Cool & Dry'), 
(4, 4, 4, 'Cetirizine', 'Antihistamine', 250, 2.20, 'BioMeds', '2026-09-10', 'Room Temperature'), 
(5, 5, 5, 'Amoxicillin', 'Antibiotic', 600, 5.00, 'MediLife', '2025-11-20', 'Refrigerated'), 
(6, 6, 6, 'Metformin', 'Diabetes', 350, 8.50, 'DiabCare', '2026-07-05', 'Cool & Dry'), 
(7, 7, 7, 'Losartan', 'Hypertension', 450, 7.00, 'HeartMed', '2027-06-25', 'Room Temperature'), 
(8, 8, 8, 'Omeprazole', 'Gastro', 380, 4.50, 'StomachCare', '2026-05-18', 'Cool & Dry'), 
(9, 9, 9, 'Atorvastatin', 'Cholesterol', 500, 6.20, 'HeartMed', '2025-12-12', 'Cool & Dry'), 
(10, 10, 10, 'Doxycycline', 'Antibiotic', 600, 5.80, 'MediLife', '2026-02-28', 'Refrigerated'), 
(11, 11, 11, 'Prednisone', 'Steroid', 320, 3.80, 'SteroidHealth', '2026-03-19', 'Room Temperature'), 
(12, 12, 12, 'Loratadine', 'Antihistamine', 400, 2.40, 'AllergyFree', '2027-01-05', 'Cool & Dry'), 
(13, 13, 13, 'Azithromycin', 'Antibiotic', 450, 6.30, 'BioMeds', '2026-11-15', 'Refrigerated'), 
(14, 14, 14, 'Hydrochlorothiazide', 'Hypertension', 500, 4.80, 'HeartMed', '2027-09-01', 'Room Temperature'), 
(15, 15, 15, 'Furosemide', 'Diuretic', 550, 5.60, 'DiabCare', '2025-08-09', 'Cool & Dry'), 
(16, 16, 16, 'Simvastatin', 'Cholesterol', 400, 6.90, 'HeartMed', '2026-06-22', 'Room Temperature'), 
(17, 17, 17, 'Albuterol', 'Respiratory', 350, 9.50, 'RespiraMeds', '2027-04-17', 'Cool & Dry'), 
(18, 18, 18, 'Clopidogrel', 'Blood Thinner', 480, 7.80, 'HeartMed', '2026-10-10', 'Room Temperature'), 
(19, 19, 19, 'Warfarin', 'Blood Thinner', 420, 8.10, 'BioMeds', '2025-07-05', 'Cool & Dry'), 
(20, 20, 20, 'Levothyroxine', 'Thyroid', 600, 10.00, 'EndoCare', '2026-12-31', 'Cool & Dry');

INSERT INTO Projects_Info (project_id, region_id, property_id, medicine_id, project_name, client_name, start_date, end_date, budget, project_manager, team_size
) VALUES
    (1, 1, 1, 1, 'Skyscraper A', 'Skyline Builders', '2024-01-15', '2026-07-30', 20000000.00, 'John Smith', 100),
    (2, 2, 2, 2, 'Luxury Villas', 'EliteHomes', '2023-10-10', '2025-12-15', 5000000.00, 'Jane Doe', 50),
    (3, 3, 3, 3, 'Mall Expansion', 'RetailBuild', '2024-03-05', '2027-01-20', 15000000.00, 'Michael Johnson', 80),
    (4, 4, 4, 4, 'Tech Park', 'InnovateInfra', '2023-11-22', '2026-10-05', 25000000.00, 'Sarah Lee', 120),
    (5, 5, 5, 5, 'City Apartments', 'UrbanLiving', '2024-05-10', '2026-09-01', 18000000.00, 'David Brown', 90),
    (6, 6, 6, 6, 'Hospital Block C', 'MediStruct', '2023-12-30', '2025-08-18', 8000000.00, 'Emily Davis', 70),
    (7, 7, 7, 7, 'Highway Expansion', 'InfraTech', '2024-02-28', '2026-12-10', 30000000.00, 'James Wilson', 200),
    (8, 8, 8, 8, 'School Construction', 'EduBuild', '2024-07-01', '2027-03-15', 10000000.00, 'Olivia Thomas', 60),
    (9, 9, 9, 9, 'Corporate Tower', 'Skyscrapers Ltd.', '2023-09-15', '2026-05-25', 22000000.00, 'Daniel Martinez', 150),
    (10, 10, 10, 10, 'Metro Station', 'MetroWorks', '2023-10-20', '2027-04-30', 35000000.00, 'Sophia Harris', 300),
    (11, 11, 11, 11, 'Green Energy Plant', 'EcoEnergy', '2024-04-01', '2028-06-20', 50000000.00, 'Ethan Clark', 250),
    (12, 12, 12, 12, 'Smart Housing', 'FutureHomes', '2024-03-25', '2026-11-15', 16000000.00, 'Isabella Young', 85),
    (13, 13, 13, 13, 'Shopping Complex', 'RetailBuild', '2023-07-12', '2026-02-28', 12000000.00, 'Alexander Walker', 110),
    (14, 14, 14, 14, 'Railway Overpass', 'RailConstruct', '2023-11-08', '2025-09-30', 40000000.00, 'Charlotte Hall', 200),
    (15, 15, 15, 15, 'Stadium Expansion', 'SportsInfra', '2024-06-18', '2028-08-10', 60000000.00, 'Benjamin Allen', 500),
    (16, 16, 16, 16, 'Luxury Resort', 'EliteHomes', '2023-09-10', '2025-07-05', 30000000.00, 'Mia Scott', 70),
    (17, 17, 17, 17, 'Data Center', 'TechInfra', '2024-01-02', '2027-12-20', 45000000.00, 'Lucas King', 300),
    (18, 18, 18, 18, 'University Building', 'EduBuild', '2023-10-15', '2026-08-15', 20000000.00, 'Harper Adams', 90),
    (19, 19, 19, 19, 'Residential Towers', 'UrbanLiving', '2024-05-22', '2027-02-28', 28000000.00, 'Elijah White', 130),
    (20, 20, 20, 20, 'Industrial Park', 'InnovateInfra', '2023-08-30', '2026-10-30', 50000000.00, 'Lily Robinson', 400);

INSERT INTO Warehouse_Stock_info (item_id, region_id, property_id, medicine_id, project_id, item_name, category, quantity_in_stock, price_per_unit, supplier_name
) VALUES
    (1, 1, 1, 1, 1, 'Cement', 'Construction Material', 1000, 5.50, 'BuildSupplies Ltd.'),
    (2, 2, 2, 2, 2, 'Bricks', 'Construction Material', 5000, 0.80, 'MasonWorks'),
    (3, 3, 3, 3, 3, 'Steel Rods', 'Construction Material', 200, 45.00, 'SteelMakers Inc.'),
    (4, 4, 4, 4, 4, 'Sand', 'Raw Material', 10000, 1.20, 'Natural Minerals'),
    (5, 5, 5, 5, 5, 'Paint Buckets', 'Finishing Material', 150, 25.00, 'ColorMasters'),
    (6, 6, 6, 6, 6, 'Tiles', 'Interior Material', 500, 15.00, 'HomeStyle Tiles'),
    (7, 7, 7, 7, 7, 'Glass Panels', 'Exterior Material', 100, 50.00, 'GlassWorks'),
    (8, 8, 8, 8, 8, 'Electric Cables', 'Electrical', 2000, 2.50, 'SafePower'),
    (9, 9, 9, 9, 9, 'LED Lights', 'Lighting', 300, 12.00, 'BrightVision'),
    (10, 10, 10, 10, 10, 'Water Pipes', 'Plumbing', 600, 8.50, 'AquaFlow'),
    (11, 11, 11, 11, 11, 'Wooden Planks', 'Carpentry', 400, 20.00, 'TimberCorp'),
    (12, 12, 12, 12, 12, 'Concrete Blocks', 'Raw Material', 800, 3.50, 'StrongBuild'),
    (13, 13, 13, 13, 13, 'Insulation Sheets', 'Construction Material', 250, 18.00, 'ThermoShield'),
    (14, 14, 14, 14, 14, 'Security Cameras', 'Safety Equipment', 50, 75.00, 'SecureVision'),
    (15, 15, 15, 15, 15, 'Fire Extinguishers', 'Safety Equipment', 40, 55.00, 'SafeGuard'),
    (16, 16, 16, 16, 16, 'Doors', 'Woodwork', 100, 120.00, 'TimberMasters'),
    (17, 17, 17, 17, 17, 'Windows', 'Woodwork', 150, 90.00, 'ClearGlass Ltd.'),
    (18, 18, 18, 18, 18, 'Aluminum Sheets', 'Roofing', 200, 30.00, 'MetalWorks'),
    (19, 19, 19, 19, 19, 'Nails & Screws', 'Fasteners', 5000, 0.10, 'FixIt Supplies'),
    (20, 20, 20, 20, 20, 'Cement Mixers', 'Machinery', 10, 1500.00, 'HeavyDuty Equipment');



//AND
SELECT * FROM Pharmacy_Inventory_info
WHERE category = 'Antibiotic' AND quantity_available > 400;

// OR
SELECT * FROM Projects_Info
WHERE (start_date <= CURDATE() AND end_date >= CURDATE()) 
OR (end_date < CURDATE()); -- Completed projects


// IN
SELECT * FROM Warehouse_Stock_info
WHERE region_id IN (1, 5, 10);

// BETWEEN
SELECT * FROM Pharmacy_Inventory_info
WHERE price_per_unit BETWEEN 5 AND 10;

// NOT IN
SELECT * FROM Projects_Info
WHERE NOT (end_date < CURDATE() OR start_date > CURDATE());

// NOT BETWEEN
SELECT * FROM Warehouse_Stock_info
WHERE quantity_in_stock NOT BETWEEN 600 AND 1000;

// LIKE
SELECT * FROM Pharmacy_Inventory_info
WHERE medicine_name LIKE '%Health%';

// GROUP BY
SELECT client_name, SUM(budget) AS total_budget 
FROM Projects_Info 
GROUP BY client_name;

// HAVING
SELECT client_name, SUM(budget) AS total_budget 
FROM Projects_Info 
GROUP BY client_name 
HAVING SUM(budget) > 50000000;

// Aggregate Functions
SELECT SUM(quantity_available) AS total_medicine_stock
FROM Pharmacy_Inventory_info;

SELECT AVG(price_per_unit) AS avg_price
FROM Pharmacy_Inventory_info;

SELECT COUNT(*) AS warehouse_count 
FROM Warehouse_Stock_info 
WHERE quantity_in_stock > 500;

SELECT MAX(price_per_unit) AS most_expensive, MIN(price_per_unit) AS cheapest
FROM Pharmacy_Inventory_info;

// GROUP BY with Aggregate Functions
SELECT client_name, AVG(budget) AS avg_budget
FROM Projects_Info
GROUP BY client_name;