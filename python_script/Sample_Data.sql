-- Sample Data for Restaurant Management Database
-- Clear existing data (optional)
-- TRUNCATE TABLE voucher_usage, reviews, order_status_history, orderlines, payments, orders, vouchers, shippers, staffs, customers, menuitem, restaurants, owners RESTART IDENTITY CASCADE;

-- Insert Owners
INSERT INTO owners (ownerfirstname, ownerlastname, email, phone, pass_hash, dob, cccd) VALUES
('John', 'Smith', 'john.smith@email.com', '+1234567890', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1980-05-15', '123456789012'),
('Sarah', 'Johnson', 'sarah.johnson@email.com', '+1234567891', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1975-08-22', '123456789013'),
('Michael', 'Davis', 'michael.davis@email.com', '+1234567892', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1982-12-10', '123456789014'),
('Emily', 'Brown', 'emily.brown@email.com', '+1234567893', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1978-03-18', '123456789015'),
('David', 'Wilson', 'david.wilson@email.com', '+1234567894', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1985-07-30', '123456789016'),
('Lisa', 'Garcia', 'lisa.garcia@email.com', '+1234567895', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1983-11-05', '123456789017'),
('Robert', 'Martinez', 'robert.martinez@email.com', '+1234567896', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1979-09-12', '123456789018'),
('Jennifer', 'Anderson', 'jennifer.anderson@email.com', '+1234567897', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1981-01-25', '123456789019'),
('James', 'Taylor', 'james.taylor@email.com', '+1234567898', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1976-06-08', '123456789020'),
('Maria', 'Rodriguez', 'maria.rodriguez@email.com', '+1234567899', '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewrBw9iYwQ8Q8Q8Q', '1984-04-14', '123456789021');

-- Insert Restaurants
INSERT INTO restaurants (restname, restaddress, phone, email, restdescription, ownerid) VALUES
('Golden Dragon', '123 Main Street, Downtown', '+1555001001', 'info@goldendragon.com', 'Authentic Asian cuisine with modern twist', 1),
('Bella Italia', '456 Oak Avenue, Little Italy', '+1555001002', 'contact@bellaitalia.com', 'Traditional Italian restaurant serving homemade pasta', 2),
('Spice Garden', '789 Pine Road, Spice District', '+1555001003', 'hello@spicegarden.com', 'Indian and Thai fusion restaurant', 3),
('Ocean Breeze', '321 Beach Boulevard, Waterfront', '+1555001004', 'info@oceanbreeze.com', 'Fresh seafood and coastal dining experience', 4),
('Farm Table', '654 Country Lane, Green Valley', '+1555001005', 'contact@farmtable.com', 'Farm-to-table restaurant with organic ingredients', 5),
('Metro Grill', '987 Downtown Plaza, Business District', '+1555001006', 'info@metrogrill.com', 'Modern American grill and steakhouse', 6),
('Sakura Sushi', '147 Cherry Street, Japan Town', '+1555001007', 'orders@sakurasushi.com', 'Premium sushi and Japanese cuisine', 7),
('Taco Fiesta', '258 Sunset Avenue, Mexican Quarter', '+1555001008', 'hola@tacofiesta.com', 'Vibrant Mexican restaurant with live music', 8),
('Green Leaf Cafe', '369 Garden Street, Eco District', '+1555001009', 'info@greenleafcafe.com', 'Vegetarian and vegan healthy options', 9),
('BBQ Master', '741 Smoke Street, BBQ Row', '+1555001010', 'orders@bbqmaster.com', 'Traditional BBQ smokehouse and grill', 10),
('Le Petit Bistro', '852 French Quarter, Historic District', '+1555001011', 'bonjour@lepetitbistro.com', 'Charming French bistro with wine selection', 1),
('Noodle House', '963 Asian Square, Food Court', '+1555001012', 'info@noodlehouse.com', 'Authentic noodle soups and stir-fries', 2);

-- Insert Menu Items
INSERT INTO menuitem (itemname, price, isavailable, restid) VALUES
-- Golden Dragon (Asian)
('Sweet and Sour Pork', 18.50, TRUE, 1),
('Kung Pao Chicken', 16.75, TRUE, 1),
('Beef Broccoli', 19.25, TRUE, 1),
('Fried Rice', 12.50, TRUE, 1),
('Spring Rolls', 8.75, TRUE, 1),
('Hot and Sour Soup', 7.50, TRUE, 1),
('Peking Duck', 28.00, TRUE, 1),
('General Tso Chicken', 17.50, FALSE, 1),

-- Bella Italia (Italian)
('Margherita Pizza', 15.50, TRUE, 2),
('Spaghetti Carbonara', 18.75, TRUE, 2),
('Lasagna', 21.50, TRUE, 2),
('Caesar Salad', 12.25, TRUE, 2),
('Tiramisu', 8.50, TRUE, 2),
('Chicken Parmigiana', 22.75, TRUE, 2),
('Fettuccine Alfredo', 19.50, TRUE, 2),
('Bruschetta', 9.75, TRUE, 2),

-- Spice Garden (Indian/Thai)
('Chicken Tikka Masala', 19.75, TRUE, 3),
('Pad Thai', 16.50, TRUE, 3),
('Green Curry', 18.25, TRUE, 3),
('Butter Chicken', 20.50, TRUE, 3),
('Tom Yum Soup', 11.75, TRUE, 3),
('Naan Bread', 4.50, TRUE, 3),
('Mango Lassi', 5.75, TRUE, 3),
('Samosas', 7.25, TRUE, 3),

-- Ocean Breeze (Seafood)
('Grilled Salmon', 26.50, TRUE, 4),
('Fish and Chips', 18.75, TRUE, 4),
('Lobster Bisque', 14.50, TRUE, 4),
('Shrimp Scampi', 24.25, TRUE, 4),
('Clam Chowder', 9.75, TRUE, 4),
('Crab Cakes', 19.50, TRUE, 4),
('Seafood Platter', 32.75, TRUE, 4),
('Oysters Rockefeller', 16.25, FALSE, 4),

-- Farm Table (Farm-to-table)
('Organic Salad Bowl', 14.50, TRUE, 5),
('Free-Range Chicken', 22.75, TRUE, 5),
('Grass-Fed Steak', 28.50, TRUE, 5),
('Roasted Vegetables', 11.25, TRUE, 5),
('Farm Burger', 16.75, TRUE, 5),
('Seasonal Soup', 8.50, TRUE, 5),
('Apple Pie', 7.75, TRUE, 5),
('Quinoa Bowl', 13.50, TRUE, 5),

-- Metro Grill (American)
('Ribeye Steak', 32.50, TRUE, 6),
('BBQ Ribs', 24.75, TRUE, 6),
('Grilled Chicken', 19.50, TRUE, 6),
('Classic Burger', 15.25, TRUE, 6),
('Loaded Fries', 9.75, TRUE, 6),
('Onion Rings', 8.50, TRUE, 6),
('Chocolate Cake', 8.25, TRUE, 6),
('Buffalo Wings', 12.75, TRUE, 6),

-- Sakura Sushi (Japanese)
('California Roll', 12.50, TRUE, 7),
('Salmon Sashimi', 18.75, TRUE, 7),
('Chicken Teriyaki', 16.50, TRUE, 7),
('Miso Soup', 4.75, TRUE, 7),
('Tempura Platter', 19.25, TRUE, 7),
('Dragon Roll', 15.75, TRUE, 7),
('Edamame', 6.50, TRUE, 7),
('Green Tea Ice Cream', 5.25, TRUE, 7),

-- Taco Fiesta (Mexican)
('Beef Tacos', 11.50, TRUE, 8),
('Chicken Quesadilla', 13.75, TRUE, 8),
('Guacamole and Chips', 8.25, TRUE, 8),
('Burrito Bowl', 14.50, TRUE, 8),
('Enchiladas', 16.75, TRUE, 8),
('Nachos Supreme', 12.25, TRUE, 8),
('Churros', 6.75, TRUE, 8),
('Margarita Chicken', 18.50, TRUE, 8),

-- Green Leaf Cafe (Vegetarian/Vegan)
('Vegan Buddha Bowl', 15.75, TRUE, 9),
('Quinoa Salad', 12.50, TRUE, 9),
('Veggie Burger', 13.25, TRUE, 9),
('Smoothie Bowl', 11.75, TRUE, 9),
('Avocado Toast', 9.50, TRUE, 9),
('Lentil Soup', 8.75, TRUE, 9),
('Raw Cake', 7.50, TRUE, 9),
('Green Juice', 6.25, TRUE, 9),

-- BBQ Master (BBQ)
('Pulled Pork Sandwich', 14.75, TRUE, 10),
('Beef Brisket', 22.50, TRUE, 10),
('BBQ Chicken', 18.25, TRUE, 10),
('Smoked Ribs', 24.75, TRUE, 10),
('Coleslaw', 5.50, TRUE, 10),
('Mac and Cheese', 7.75, TRUE, 10),
('Cornbread', 4.25, TRUE, 10),
('Peach Cobbler', 8.50, TRUE, 10),

-- Le Petit Bistro (French)
('Coq au Vin', 24.50, TRUE, 11),
('French Onion Soup', 9.75, TRUE, 11),
('Beef Bourguignon', 26.75, TRUE, 11),
('Ratatouille', 16.50, TRUE, 11),
('Escargot', 14.25, TRUE, 11),
('Crème Brûlée', 8.75, TRUE, 11),
('Duck Confit', 28.50, TRUE, 11),
('Cheese Plate', 18.25, TRUE, 11),

-- Noodle House (Asian Noodles)
('Pho Bo', 13.50, TRUE, 12),
('Ramen Bowl', 14.75, TRUE, 12),
('Udon Noodles', 12.25, TRUE, 12),
('Chow Mein', 11.50, TRUE, 12),
('Dumplings', 9.75, TRUE, 12),
('Bun Bo Hue', 14.25, TRUE, 12),
('Egg Rolls', 7.50, TRUE, 12),
('Bubble Tea', 5.75, TRUE, 12);

-- Insert Customers
INSERT INTO customers (custfirstname, custlastname, custaddress, email, gender, phone, dob, pass_hash) VALUES
('Alice', 'Cooper', '123 Elm Street, Apt 4B', 'alice.cooper@email.com', 'F', '+1555100001', '1990-03-15', '$2b$12$password_hash_1'),
('Bob', 'Miller', '456 Maple Avenue', 'bob.miller@email.com', 'M', '+1555100002', '1985-07-22', '$2b$12$password_hash_2'),
('Carol', 'White', '789 Oak Drive, Unit 12', 'carol.white@email.com', 'F', '+1555100003', '1992-11-08', '$2b$12$password_hash_3'),
('Daniel', 'Green', '321 Pine Street', 'daniel.green@email.com', 'M', '+1555100004', '1988-01-30', '$2b$12$password_hash_4'),
('Eva', 'Black', '654 Cedar Lane', 'eva.black@email.com', 'F', '+1555100005', '1995-05-18', '$2b$12$password_hash_5'),
('Frank', 'Blue', '987 Birch Road', 'frank.blue@email.com', 'M', '+1555100006', '1983-09-12', '$2b$12$password_hash_6'),
('Grace', 'Red', '147 Willow Street', 'grace.red@email.com', 'F', '+1555100007', '1991-12-25', '$2b$12$password_hash_7'),
('Henry', 'Gold', '258 Spruce Avenue', 'henry.gold@email.com', 'M', '+1555100008', '1987-04-03', '$2b$12$password_hash_8'),
('Iris', 'Silver', '369 Ash Drive', 'iris.silver@email.com', 'F', '+1555100009', '1993-08-17', '$2b$12$password_hash_9'),
('Jack', 'Bronze', '741 Poplar Lane', 'jack.bronze@email.com', 'M', '+1555100010', '1986-06-28', '$2b$12$password_hash_10'),
('Kate', 'Rose', '852 Cherry Street', 'kate.rose@email.com', 'F', '+1555100011', '1994-02-14', '$2b$12$password_hash_11'),
('Liam', 'Stone', '963 Peach Avenue', 'liam.stone@email.com', 'M', '+1555100012', '1989-10-05', '$2b$12$password_hash_12'),
('Mia', 'Wood', '159 Apple Drive', 'mia.wood@email.com', 'F', '+1555100013', '1996-07-19', '$2b$12$password_hash_13'),
('Noah', 'Steel', '357 Orange Lane', 'noah.steel@email.com', 'M', '+1555100014', '1984-03-11', '$2b$12$password_hash_14'),
('Olivia', 'Glass', '468 Lemon Street', 'olivia.glass@email.com', 'F', '+1555100015', '1997-11-23', '$2b$12$password_hash_15'),
('Paul', 'Crystal', '579 Lime Avenue', 'paul.crystal@email.com', 'M', '+1555100016', '1982-05-07', '$2b$12$password_hash_16'),
('Quinn', 'Diamond', '680 Grape Drive', 'quinn.diamond@email.com', 'O', '+1555100017', '1998-09-01', '$2b$12$password_hash_17'),
('Ruby', 'Pearl', '791 Berry Lane', 'ruby.pearl@email.com', 'F', '+1555100018', '1981-12-13', '$2b$12$password_hash_18'),
('Sam', 'Jade', '802 Mint Street', 'sam.jade@email.com', 'M', '+1555100019', '1999-04-26', '$2b$12$password_hash_19'),
('Tina', 'Coral', '913 Sage Avenue', 'tina.coral@email.com', 'F', '+1555100020', '1980-08-15', '$2b$12$password_hash_20');

-- Insert Staff
INSERT INTO staffs (stafffirstname, stafflastname, gender, cccd, dob, phone, restid, pass_hash) VALUES
-- Golden Dragon Staff
('Peter', 'Wang', 'M', '200001001001', '1992-01-15', '+1555200001', 1, '$2b$12$staff_hash_1'),
('Linda', 'Chen', 'F', '200001001002', '1988-05-20', '+1555200002', 1, '$2b$12$staff_hash_2'),
('Tony', 'Liu', 'M', '200001001003', '1995-09-10', '+1555200003', 1, '$2b$12$staff_hash_3'),
-- Bella Italia Staff
('Marco', 'Rossi', 'M', '200002001001', '1990-03-25', '+1555200004', 2, '$2b$12$staff_hash_4'),
('Sofia', 'Ferrari', 'F', '200002001002', '1993-07-18', '+1555200005', 2, '$2b$12$staff_hash_5'),
('Giuseppe', 'Romano', 'M', '200002001003', '1987-11-08', '+1555200006', 2, '$2b$12$staff_hash_6'),
-- Spice Garden Staff
('Raj', 'Patel', 'M', '200003001001', '1991-06-12', '+1555200007', 3, '$2b$12$staff_hash_7'),
('Priya', 'Sharma', 'F', '200003001002', '1994-02-28', '+1555200008', 3, '$2b$12$staff_hash_8'),
-- Ocean Breeze Staff
('Mike', 'Fisher', 'M', '200004001001', '1989-08-14', '+1555200009', 4, '$2b$12$staff_hash_9'),
('Sandy', 'Waves', 'F', '200004001002', '1992-12-03', '+1555200010', 4, '$2b$12$staff_hash_10'),
-- Farm Table Staff
('Ethan', 'Fields', 'M', '200005001001', '1996-04-22', '+1555200011', 5, '$2b$12$staff_hash_11'),
('Hazel', 'Grove', 'F', '200005001002', '1993-10-17', '+1555200012', 5, '$2b$12$staff_hash_12'),
-- Metro Grill Staff
('Alex', 'Steel', 'M', '200006001001', '1988-01-09', '+1555200013', 6, '$2b$12$staff_hash_13'),
('Jessica', 'Metro', 'F', '200006001002', '1991-05-31', '+1555200014', 6, '$2b$12$staff_hash_14'),
-- Sakura Sushi Staff
('Hiroshi', 'Tanaka', 'M', '200007001001', '1990-07-25', '+1555200015', 7, '$2b$12$staff_hash_15'),
('Yuki', 'Sato', 'F', '200007001002', '1994-03-16', '+1555200016', 7, '$2b$12$staff_hash_16'),
-- Taco Fiesta Staff
('Carlos', 'Rodriguez', 'M', '200008001001', '1992-09-07', '+1555200017', 8, '$2b$12$staff_hash_17'),
('Maria', 'Lopez', 'F', '200008001002', '1995-11-21', '+1555200018', 8, '$2b$12$staff_hash_18'),
-- Green Leaf Staff
('Sage', 'Green', 'O', '200009001001', '1993-06-04', '+1555200019', 9, '$2b$12$staff_hash_19'),
('Willow', 'Branch', 'F', '200009001002', '1996-08-29', '+1555200020', 9, '$2b$12$staff_hash_20'),
-- BBQ Master Staff
('Jake', 'Smoke', 'M', '200010001001', '1987-12-11', '+1555200021', 10, '$2b$12$staff_hash_21'),
('Amber', 'Fire', 'F', '200010001002', '1990-02-23', '+1555200022', 10, '$2b$12$staff_hash_22'),
-- Le Petit Bistro Staff
('Pierre', 'Dubois', 'M', '200011001001', '1989-04-15', '+1555200023', 11, '$2b$12$staff_hash_23'),
('Amélie', 'Martin', 'F', '200011001002', '1992-08-06', '+1555200024', 11, '$2b$12$staff_hash_24'),
-- Noodle House Staff
('Kevin', 'Noodle', 'M', '200012001001', '1994-01-28', '+1555200025', 12, '$2b$12$staff_hash_25'),
('Anna', 'Bowl', 'F', '200012001002', '1991-07-13', '+1555200026', 12, '$2b$12$staff_hash_26');

-- Insert Shippers
INSERT INTO shippers (shipfirstname, shiplastname, gender, cccd, dob, phone, restid, pass_hash) VALUES
('Rick', 'Fast', 'M', '300001001001', '1991-03-12', '+1555300001', 1, '$2b$12$shipper_hash_1'),
('Speed', 'Quick', 'M', '300001001002', '1993-07-25', '+1555300002', 1, '$2b$12$shipper_hash_2'),
('Luna', 'Swift', 'F', '300002001001', '1992-11-08', '+1555300003', 2, '$2b$12$shipper_hash_3'),
('Flash', 'Delivery', 'M', '300002001002', '1989-05-19', '+1555300004', 2, '$2b$12$shipper_hash_4'),
('Zoom', 'Express', 'M', '300003001001', '1994-09-14', '+1555300005', 3, '$2b$12$shipper_hash_5'),
('Dash', 'Runner', 'F', '300003001002', '1990-01-30', '+1555300006', 3, '$2b$12$shipper_hash_6'),
('Bolt', 'Lightning', 'M', '300004001001', '1995-06-22', '+1555300007', 4, '$2b$12$shipper_hash_7'),
('Arrow', 'Direct', 'F', '300004001002', '1988-12-03', '+1555300008', 4, '$2b$12$shipper_hash_8'),
('Rocket', 'Speedy', 'M', '300005001001', '1993-04-17', '+1555300009', 5, '$2b$12$shipper_hash_9'),
('Jet', 'Stream', 'F', '300005001002', '1991-08-26', '+1555300010', 5, '$2b$12$shipper_hash_10'),
('Turbo', 'Rush', 'M', '300006001001', '1992-02-11', '+1555300011', 6, '$2b$12$shipper_hash_11'),
('Rapid', 'Move', 'F', '300006001002', '1994-10-05', '+1555300012', 6, '$2b$12$shipper_hash_12'),
('Sonic', 'Boom', 'M', '300007001001', '1990-07-18', '+1555300013', 7, '$2b$12$shipper_hash_13'),
('Blaze', 'Trail', 'F', '300007001002', '1996-03-29', '+1555300014', 7, '$2b$12$shipper_hash_14'),
('Wind', 'Walker', 'O', '300008001001', '1989-11-12', '+1555300015', 8, '$2b$12$shipper_hash_15'),
('Storm', 'Rider', 'M', '300008001002', '1993-05-24', '+1555300016', 8, '$2b$12$shipper_hash_16'),
('Thunder', 'Strike', 'F', '300009001001', '1995-09-07', '+1555300017', 9, '$2b$12$shipper_hash_17'),
('Lightning', 'Bolt', 'M', '300009001002', '1987-01-16', '+1555300018', 9, '$2b$12$shipper_hash_18'),
('Comet', 'Tail', 'F', '300010001001', '1994-06-03', '+1555300019', 10, '$2b$12$shipper_hash_19'),
('Meteor', 'Shower', 'M', '300010001002', '1992-12-21', '+1555300020', 10, '$2b$12$shipper_hash_20');

-- Insert Vouchers
INSERT INTO vouchers (code, discount, startdate, enddate, max_usage, current_usage, min_order_value) VALUES
('WELCOME10', 10.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1000, 245, 20.00),
('SAVE15', 15.00, '2024-06-01 00:00:00', '2024-08-31 23:59:59', 500, 127, 50.00),
('STUDENT20', 20.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 200, 89, 30.00),
('FAMILY25', 25.00, '2024-05-01 00:00:00', '2024-07-31 23:59:59', 300, 156, 75.00),
('WEEKEND5', 5.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 2000, 678, 15.00),
('FIRSTORDER', 30.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1500, 423, 25.00),
('LOYAL50', 50.00, '2024-03-01 00:00:00', '2024-09-30 23:59:59', 100, 34, 100.00),
('SUMMER12', 12.00, '2024-06-15 00:00:00', '2024-08-15 23:59:59', 800, 234, 40.00),
('BIGORDER', 35.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 250, 67, 150.00),
('FLASH8', 8.00, '2024-01-01 00:00:00', '2024-12-31 23:59:59', 1200, 445, 25.00);

-- Insert Orders (mix of online and offline orders)
INSERT INTO orders (order_timestamp, totalamount, finalTotal, destination, custid, staffid, shipid, status, order_type) VALUES
-- Recent orders (last 30 days)
('2024-05-25 12:30:00', 45.50, 40.95, '123 Elm Street, Apt 4B', 1, 1, 1, 'delivered', 'online'),
('2024-05-25 13:15:00', 32.75, 32.75, 'Golden Dragon Restaurant', 2, 1, NULL, 'offline', 'offline'),
('2024-05-25 18:45:00', 67.25, 57.16, '456 Maple Avenue', 3, 4, 3, 'delivered', 'online'),
('2024-05-26 11:20:00', 28.50, 28.50, 'Bella Italia Restaurant', 4, 4, NULL, 'offline', 'offline'),
('2024-05-26 19:30:00', 89.75, 71.80, '789 Oak Drive, Unit 12', 5, 7, 5, 'delivered', 'online'),
('2024-05-27 12:00:00', 54.25, 54.25, '321 Pine Street', 6, 9, 7, 'delivered', 'online'),
('2024-05-27 20:15:00', 76.50, 65.03, '654 Cedar Lane', 7, 11, 9, 'delivered', 'online'),
('2024-05-28 13:45:00', 42.00, 42.00, 'Farm Table Restaurant', 8, 11, NULL, 'offline', 'offline'),
('2024-05-28 19:00:00', 95.25, 95.25, '987 Birch Road', 9, 13, 11, 'delivered', 'online'),
('2024-05-29 12:30:00', 38.75, 38.75, '147 Willow Street', 10, 15, 13, 'delivered', 'online'),
('2024-05-29 18:20:00', 63.50, 63.50, 'Taco Fiesta Restaurant', 11, 17, NULL, 'offline', 'offline'),
('2024-05-30 11:45:00', 29.25, 27.79, '258 Spruce Avenue', 12, 19, 17, 'delivered', 'online'),
('2024-05-30 20:30:00', 81.75, 81.75, '369 Ash Drive', 13, 21, 19, 'delivered', 'online'),
('2024-05-31 14:15:00', 47.50, 47.50, 'Le Petit Bistro Restaurant', 14, 23, NULL, 'offline', 'offline'),
('2024-06-01 12:00:00', 56.25, 56.25, '741 Poplar Lane', 15, 25, 1, 'delivered', 'online'),
('2024-06-01 19:45:00', 73.00, 73.00, '852 Cherry Street', 16, 2, 2, 'delivered', 'online'),
('2024-06-02 13:30:00', 34.75, 34.75, '963 Peach Avenue', 17, 5, 4, 'delivered', 'online'),
('2024-06-02 18:15:00', 88.50, 88.50, 'Spice Garden Restaurant', 18, 7, NULL, 'offline', 'offline'),
('2024-06-03 11:20:00', 52.25, 44.39, '159 Apple Drive', 19, 10, 8, 'delivered', 'online'),
('2024-06-03 20:00:00', 67.75, 67.75, '357 Orange Lane', 20, 12, 10, 'delivered', 'online'),
('2024-06-04 12:45:00', 41.50, 41.50, '468 Lemon Street', 1, 14, 12, 'delivered', 'online'),
('2024-06-04 19:30:00', 79.25, 79.25, 'Metro Grill Restaurant', 2, 13, NULL, 'offline', 'offline'),
('2024-06-05 13:15:00', 36.00, 36.00, '579 Lime Avenue', 3, 16, 14, 'delivered', 'online'),
('2024-06-05 18:45:00', 92.75, 92.75, '680 Grape Drive', 4, 18, 16, 'delivered', 'online'),
('2024-06-06 11:30:00', 48.25, 48.25, 'Green Leaf Cafe Restaurant', 5, 19, NULL, 'offline', 'offline'),
('2024-06-06 20:15:00', 64.50, 64.50, '791 Berry Lane', 6, 22, 20, 'delivered', 'online'),
('2024-06-07 12:00:00', 58.75, 58.75, '802 Mint Street', 7, 24, 1, 'delivered', 'online'),
('2024-06-07 19:00:00', 75.25, 75.25, '913 Sage Avenue', 8, 26, 2, 'delivered', 'online'),
('2024-06-08 14:30:00', 43.50, 43.50, 'Noodle House Restaurant', 9, 25, NULL, 'offline', 'offline'),
('2024-06-08 18:20:00', 86.00, 86.00, '123 Elm Street, Apt 4B', 10, 3, 6, 'delivered', 'online'),
('2024-06-09 11:45:00', 51.75, 51.75, '456 Maple Avenue', 11, 6, 8, 'processing', 'online'),
('2024-06-09 12:30:00', 39.25, 39.25, '789 Oak Drive, Unit 12', 12, 8, 10, 'waiting_for_delivery', 'online'),
('2024-06-09 13:15:00', 72.50, 72.50, '321 Pine Street', 13, 10, 12, 'shipped', 'online'),

-- Older orders for historical data
('2024-04-15 12:30:00', 45.75, 45.75, '654 Cedar Lane', 14, 1, 1, 'delivered', 'online'),
('2024-04-16 18:45:00', 62.25, 62.25, '987 Birch Road', 15, 4, 3, 'delivered', 'online'),
('2024-04-17 11:20:00', 38.50, 38.50, 'Golden Dragon Restaurant', 16, 1, NULL, 'offline', 'offline'),
('2024-04-18 19:30:00', 84.75, 84.75, '147 Willow Street', 17, 7, 5, 'delivered', 'online'),
('2024-04-19 12:00:00', 56.25, 56.25, '258 Spruce Avenue', 18, 9, 7, 'delivered', 'online'),
('2024-04-20 20:15:00', 71.50, 71.50, 'Ocean Breeze Restaurant', 19, 9, NULL, 'offline', 'offline'),
('2024-04-21 13:45:00', 49.00, 49.00, '369 Ash Drive', 20, 11, 9, 'delivered', 'online'),
('2024-04-22 19:00:00', 93.25, 93.25, '741 Poplar Lane', 1, 13, 11, 'delivered', 'online'),
('2024-04-23 12:30:00', 41.75, 41.75, 'Metro Grill Restaurant', 2, 13, NULL, 'offline', 'offline'),
('2024-04-24 18:20:00', 67.50, 67.50, '852 Cherry Street', 3, 15, 13, 'delivered', 'online'),
('2024-04-25 11:45:00', 35.25, 35.25, '963 Peach Avenue', 4, 17, 15, 'delivered', 'online'),
('2024-04-26 20:30:00', 78.75, 78.75, 'Taco Fiesta Restaurant', 5, 17, NULL, 'offline', 'offline'),
('2024-04-27 14:15:00', 52.50, 52.50, '159 Apple Drive', 6, 19, 17, 'delivered', 'online'),
('2024-04-28 12:00:00', 89.00, 89.00, '357 Orange Lane', 7, 21, 19, 'delivered', 'online'),
('2024-04-29 19:45:00', 46.25, 46.25, 'BBQ Master Restaurant', 8, 21, NULL, 'offline', 'offline'),
('2024-04-30 13:30:00', 64.75, 64.75, '468 Lemon Street', 9, 23, 1, 'delivered', 'online'),

-- March orders
('2024-03-10 12:15:00', 54.50, 54.50, '579 Lime Avenue', 10, 25, 2, 'delivered', 'online'),
('2024-03-11 18:30:00', 37.25, 37.25, 'Noodle House Restaurant', 11, 25, NULL, 'offline', 'offline'),
('2024-03-12 11:45:00', 82.75, 82.75, '680 Grape Drive', 12, 2, 4, 'delivered', 'online'),
('2024-03-13 20:00:00', 59.50, 59.50, '791 Berry Lane', 13, 5, 6, 'delivered', 'online'),
('2024-03-14 13:20:00', 43.75, 43.75, 'Spice Garden Restaurant', 14, 7, NULL, 'offline', 'offline'),
('2024-03-15 19:15:00', 76.25, 76.25, '802 Mint Street', 15, 10, 8, 'delivered', 'online'),
('2024-03-16 12:30:00', 48.00, 48.00, '913 Sage Avenue', 16, 12, 10, 'delivered', 'online'),
('2024-03-17 18:45:00', 91.50, 91.50, 'Farm Table Restaurant', 17, 11, NULL, 'offline', 'offline'),
('2024-03-18 11:15:00', 36.75, 36.75, '123 Elm Street, Apt 4B', 18, 14, 12, 'delivered', 'online'),
('2024-03-19 20:30:00', 68.25, 68.25, '456 Maple Avenue', 19, 16, 14, 'delivered', 'online'),
('2024-03-20 14:00:00', 55.50, 55.50, 'Sakura Sushi Restaurant', 20, 15, NULL, 'offline', 'offline');

-- Insert Order Lines
INSERT INTO orderlines (orderid, itemid, quantity, price_at_purchase) VALUES
-- Order 1 (Golden Dragon)
(1, 1, 2, 18.50), (1, 4, 1, 12.50), (1, 5, 1, 8.75),
-- Order 2 (Golden Dragon - offline)
(2, 2, 1, 16.75), (2, 6, 1, 7.50), (2, 5, 1, 8.50),
-- Order 3 (Bella Italia)
(3, 9, 1, 15.50), (3, 10, 1, 18.75), (3, 12, 1, 12.25), (3, 15, 1, 19.50),
-- Order 4 (Bella Italia - offline)
(4, 11, 1, 21.50), (4, 16, 1, 8.50),
-- Order 5 (Spice Garden)
(5, 17, 1, 19.75), (5, 18, 1, 16.50), (5, 19, 1, 18.25), (5, 21, 2, 11.75), (5, 22, 2, 4.50), (5, 24, 2, 7.25),
-- Order 6 (Ocean Breeze)
(6, 25, 1, 26.50), (6, 27, 1, 14.50), (6, 29, 1, 9.75),
-- Order 7 (Farm Table)
(7, 33, 1, 14.50), (7, 34, 1, 22.75), (7, 35, 1, 28.50), (7, 37, 1, 16.75),
-- Order 8 (Farm Table - offline)
(8, 36, 1, 11.25), (8, 38, 1, 8.50), (8, 39, 1, 7.75), (8, 40, 1, 13.50),
-- Order 9 (Metro Grill)
(9, 41, 1, 32.50), (9, 42, 1, 24.75), (9, 43, 1, 19.50), (9, 45, 1, 9.75), (9, 47, 1, 8.25),
-- Order 10 (Sakura Sushi)
(10, 49, 2, 12.50), (10, 51, 1, 16.50), (10, 53, 1, 19.25),
-- Order 11 (Taco Fiesta - offline)
(11, 57, 2, 11.50), (11, 58, 1, 13.75), (11, 59, 1, 8.25), (11, 61, 1, 16.75), (11, 63, 1, 6.75),
-- Order 12 (Green Leaf)
(12, 65, 1, 15.75), (12, 67, 1, 13.25),
-- Order 13 (BBQ Master)
(13, 73, 1, 14.75), (13, 74, 1, 22.50), (13, 75, 1, 18.25), (13, 76, 1, 24.75),
-- Order 14 (Le Petit Bistro - offline)
(14, 81, 1, 24.50), (14, 83, 1, 26.75),
-- Order 15 (Noodle House)
(15, 89, 2, 13.50), (15, 90, 1, 14.75), (15, 93, 1, 9.75), (15, 96, 1, 5.75),
-- Order 16 (Golden Dragon)
(16, 3, 1, 19.25), (16, 7, 1, 28.00), (16, 1, 1, 18.50), (16, 6, 1, 7.25),
-- Order 17 (Bella Italia)
(17, 10, 1, 18.75), (17, 16, 1, 9.75),
-- Order 18 (Spice Garden - offline)
(18, 17, 1, 19.75), (18, 20, 1, 20.50), (18, 19, 1, 18.25), (18, 21, 1, 11.75), (18, 22, 2, 4.50), (18, 23, 2, 5.75), (18, 24, 1, 7.25),
-- Order 19 (Ocean Breeze)
(19, 28, 1, 24.25), (19, 30, 1, 19.50), (19, 31, 1, 32.75),
-- Order 20 (Farm Table)
(20, 34, 1, 22.75), (20, 35, 1, 28.50), (20, 36, 1, 11.25), (20, 38, 1, 8.50),
-- Order 21 (Metro Grill)
(21, 44, 1, 15.25), (21, 45, 1, 9.75), (21, 46, 1, 8.50), (21, 47, 1, 8.25),
-- Order 22 (Metro Grill - offline)
(22, 41, 1, 32.50), (22, 42, 1, 24.75), (22, 48, 1, 12.75),
-- Order 23 (Sakura Sushi)
(23, 50, 1, 18.75), (23, 52, 1, 4.75), (23, 54, 1, 15.75), (23, 56, 1, 5.25),
-- Order 24 (Taco Fiesta)
(24, 60, 1, 14.50), (24, 61, 1, 16.75), (24, 62, 1, 12.25), (24, 64, 1, 18.50), (24, 59, 1, 8.25), (24, 63, 2, 6.75),
-- Order 25 (Green Leaf - offline)
(25, 66, 1, 12.50), (25, 68, 1, 11.75), (25, 69, 1, 9.50), (25, 71, 1, 7.50), (25, 72, 1, 6.25),
-- Order 26 (BBQ Master)
(26, 74, 1, 22.50), (26, 75, 1, 18.25), (26, 77, 1, 5.50), (26, 78, 1, 7.75), (26, 79, 1, 4.25), (26, 80, 1, 8.50),
-- Order 27 (Le Petit Bistro)
(27, 82, 1, 9.75), (27, 84, 1, 16.50), (27, 85, 1, 14.25), (27, 86, 1, 8.75), (27, 88, 1, 18.25),
-- Order 28 (Noodle House)
(28, 89, 1, 13.50), (28, 90, 1, 14.75), (28, 91, 1, 12.25), (28, 92, 1, 11.50), (28, 93, 1, 9.75), (28, 95, 1, 7.50), (28, 96, 1, 5.75),
-- Additional orders continue...
(29, 1, 1, 18.50), (29, 2, 1, 16.75), (29, 4, 1, 12.50),
(30, 9, 1, 15.50), (30, 10, 1, 18.75), (30, 13, 1, 22.75), (30, 15, 1, 19.50),
(31, 17, 1, 19.75), (31, 18, 1, 16.50), (31, 22, 1, 4.50),
(32, 25, 1, 26.50), (32, 26, 1, 18.75), (32, 27, 1, 14.50), (32, 28, 1, 24.25),
(33, 33, 1, 14.50), (33, 34, 1, 22.75), (33, 36, 1, 11.25), (33, 37, 1, 16.75),
(34, 41, 1, 32.50), (34, 43, 1, 19.50), (34, 45, 1, 9.75), (34, 48, 1, 12.75),
(35, 49, 1, 12.50), (35, 50, 1, 18.75), (35, 53, 1, 19.25),
(36, 57, 1, 11.50), (36, 58, 1, 13.75), (36, 59, 1, 8.25), (36, 60, 1, 14.50), (36, 64, 1, 18.50),
(37, 65, 1, 15.75), (37, 66, 1, 12.50), (37, 68, 1, 11.75), (37, 70, 1, 8.75),
(38, 73, 1, 14.75), (38, 74, 1, 22.50), (38, 75, 1, 18.25), (38, 76, 1, 24.75), (38, 78, 1, 7.75), (38, 80, 1, 8.50),
(39, 81, 1, 24.50), (39, 83, 1, 26.75),
(40, 89, 1, 13.50), (40, 90, 1, 14.75), (40, 91, 1, 12.25), (40, 92, 1, 11.50), (40, 93, 1, 9.75), (40, 95, 1, 7.50),
(41, 2, 1, 16.75), (41, 3, 1, 19.25), (41, 5, 1, 8.75), (41, 6, 1, 7.50),
(42, 10, 1, 18.75), (42, 11, 1, 21.50), (42, 14, 1, 12.25), (42, 16, 1, 9.75),
(43, 19, 1, 18.25), (43, 20, 1, 20.50), (43, 23, 1, 5.75), (43, 24, 1, 7.25),
(44, 26, 1, 18.75), (44, 27, 1, 14.50), (44, 29, 1, 9.75), (44, 30, 1, 19.50),
(45, 35, 1, 28.50), (45, 37, 1, 16.75), (45, 38, 1, 8.50),
(46, 42, 1, 24.75), (46, 44, 1, 15.25), (46, 46, 1, 8.50), (46, 47, 1, 8.25),
(47, 51, 1, 16.50), (47, 52, 1, 4.75), (47, 54, 1, 15.75),
(48, 58, 1, 13.75), (48, 61, 1, 16.75), (48, 62, 1, 12.25), (48, 63, 1, 6.75),
(49, 67, 1, 13.25), (49, 69, 1, 9.50), (49, 71, 1, 7.50), (49, 72, 1, 6.25),
(50, 75, 1, 18.25), (50, 76, 1, 24.75), (50, 78, 1, 7.75), (50, 79, 1, 4.25),
(51, 82, 1, 9.75), (51, 84, 1, 16.50), (51, 85, 1, 14.25), (51, 86, 1, 8.75), (51, 87, 1, 28.50),
(52, 90, 1, 14.75), (52, 92, 1, 11.50), (52, 93, 1, 9.75), (52, 96, 1, 5.75);

-- Insert Payments
INSERT INTO payments (orderid, paytime, method, amount, status, transaction_id) VALUES
(1, '2024-05-25 12:35:00', 'Credit Card', 40.95, 'completed', 'TXN_001_20240525_001'),
(2, '2024-05-25 13:20:00', 'Cash', 32.75, 'completed', 'CASH_001_20240525_001'),
(3, '2024-05-25 18:50:00', 'Digital Wallet', 57.16, 'completed', 'DW_001_20240525_001'),
(4, '2024-05-26 11:25:00', 'Cash', 28.50, 'completed', 'CASH_002_20240526_001'),
(5, '2024-05-26 19:35:00', 'Credit Card', 71.80, 'completed', 'TXN_002_20240526_001'),
(6, '2024-05-27 12:05:00', 'Digital Wallet', 54.25, 'completed', 'DW_002_20240527_001'),
(7, '2024-05-27 20:20:00', 'Credit Card', 65.03, 'completed', 'TXN_003_20240527_001'),
(8, '2024-05-28 13:50:00', 'Cash', 42.00, 'completed', 'CASH_003_20240528_001'),
(9, '2024-05-28 19:05:00', 'Credit Card', 95.25, 'completed', 'TXN_004_20240528_001'),
(10, '2024-05-29 12:35:00', 'Digital Wallet', 38.75, 'completed', 'DW_003_20240529_001'),
(11, '2024-05-29 18:25:00', 'Cash', 63.50, 'completed', 'CASH_004_20240529_001'),
(12, '2024-05-30 11:50:00', 'Credit Card', 27.79, 'completed', 'TXN_005_20240530_001'),
(13, '2024-05-30 20:35:00', 'Digital Wallet', 81.75, 'completed', 'DW_004_20240530_001'),
(14, '2024-05-31 14:20:00', 'Cash', 47.50, 'completed', 'CASH_005_20240531_001'),
(15, '2024-06-01 12:05:00', 'Credit Card', 56.25, 'completed', 'TXN_006_20240601_001'),
(16, '2024-06-01 19:50:00', 'Digital Wallet', 73.00, 'completed', 'DW_005_20240601_001'),
(17, '2024-06-02 13:35:00', 'Credit Card', 34.75, 'completed', 'TXN_007_20240602_001'),
(18, '2024-06-02 18:20:00', 'Cash', 88.50, 'completed', 'CASH_006_20240602_001'),
(19, '2024-06-03 11:25:00', 'Digital Wallet', 44.39, 'completed', 'DW_006_20240603_001'),
(20, '2024-06-03 20:05:00', 'Credit Card', 67.75, 'completed', 'TXN_008_20240603_001'),
(21, '2024-06-04 12:50:00', 'Digital Wallet', 41.50, 'completed', 'DW_007_20240604_001'),
(22, '2024-06-04 19:35:00', 'Cash', 79.25, 'completed', 'CASH_007_20240604_001'),
(23, '2024-06-05 13:20:00', 'Credit Card', 36.00, 'completed', 'TXN_009_20240605_001'),
(24, '2024-06-05 18:50:00', 'Digital Wallet', 92.75, 'completed', 'DW_008_20240605_001'),
(25, '2024-06-06 11:35:00', 'Cash', 48.25, 'completed', 'CASH_008_20240606_001'),
(26, '2024-06-06 20:20:00', 'Credit Card', 64.50, 'completed', 'TXN_010_20240606_001'),
(27, '2024-06-07 12:05:00', 'Digital Wallet', 58.75, 'completed', 'DW_009_20240607_001'),
(28, '2024-06-07 19:05:00', 'Credit Card', 75.25, 'completed', 'TXN_011_20240607_001'),
(29, '2024-06-08 14:35:00', 'Cash', 43.50, 'completed', 'CASH_009_20240608_001'),
(30, '2024-06-08 18:25:00', 'Digital Wallet', 86.00, 'completed', 'DW_010_20240608_001'),
(31, '2024-06-09 11:50:00', 'Credit Card', 51.75, 'pending', 'TXN_012_20240609_001'),
(32, '2024-06-09 12:35:00', 'Digital Wallet', 39.25, 'pending', 'DW_011_20240609_001'),
(33, '2024-06-09 13:20:00', 'Credit Card', 72.50, 'completed', 'TXN_013_20240609_001'),
-- Historical payments
(34, '2024-04-15 12:35:00', 'Credit Card', 45.75, 'completed', 'TXN_H001_20240415_001'),
(35, '2024-04-16 18:50:00', 'Digital Wallet', 62.25, 'completed', 'DW_H001_20240416_001'),
(36, '2024-04-17 11:25:00', 'Cash', 38.50, 'completed', 'CASH_H001_20240417_001'),
(37, '2024-04-18 19:35:00', 'Credit Card', 84.75, 'completed', 'TXN_H002_20240418_001'),
(38, '2024-04-19 12:05:00', 'Digital Wallet', 56.25, 'completed', 'DW_H002_20240419_001'),
(39, '2024-04-20 20:20:00', 'Cash', 71.50, 'completed', 'CASH_H002_20240420_001'),
(40, '2024-04-21 13:50:00', 'Credit Card', 49.00, 'completed', 'TXN_H003_20240421_001'),
(41, '2024-04-22 19:05:00', 'Digital Wallet', 93.25, 'completed', 'DW_H003_20240422_001'),
(42, '2024-04-23 12:35:00', 'Cash', 41.75, 'completed', 'CASH_H003_20240423_001'),
(43, '2024-04-24 18:25:00', 'Credit Card', 67.50, 'completed', 'TXN_H004_20240424_001'),
(44, '2024-04-25 11:50:00', 'Digital Wallet', 35.25, 'completed', 'DW_H004_20240425_001');