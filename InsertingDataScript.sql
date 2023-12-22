USE Fish_Shop_Database;

START TRANSACTION;

INSERT INTO Fish_in_Stock (Stock_ID, Stock_Quantity, Species, Price, Freshwater, Saltwater)
VALUES
    (201, 100, 'Clownfish', 10.99, FALSE, TRUE),
    (202, 50, 'Goldfish', 15.99, TRUE, FALSE),
    (203, 75, 'Pufferfish', 8.99, TRUE, TRUE);

-- Insert data into Customer_Location table
INSERT INTO Customer_Location (Location_ID, Customer_City, Customer_Postcode, Customer_Country, Customer_HouseNumber)
VALUES
    (301, 'Norwich', 'NR4 3P5','England','42'),
	(302, 'Ipswich', 'IP5 6N3','England','53'),
	(303, 'Chelmsford', 'CM6 7Y3','England','127');

-- Insert data into Customer_Information table
INSERT INTO Customer_Information (Customer_ID, Location_ID, First_Name, Last_Name)
VALUES
    (501,301, 'Barry', 'Smith'),
    (502,302, 'Marco', 'Polo'),
    (503,303, 'Jerry', 'Johnson');

-- Insert data into Employee_Information table
INSERT INTO Employee_Information (Employee_ID, Date_Of_Birth, First_Name, Last_Name, Emergency_Contact_Number, Working_Productivity, Packaging_Efficiency)
VALUES
    (401,'1990-01-15', 'Barry', 'Ortiz', 07646876463, 0.71, 0.84),
    (402,'1985-03-20', 'Dave', 'Reed', 08463759382, 0.72, 0.36),
	(403,'1992-01-11', 'Steve', 'Tyson', 09403726475, 0.91, 0.82),
    (404,'1981-07-20', 'Micheal', 'Lineker', 01527693746, 0.59, 0.41);
-- Insert data into Order_Information table
INSERT INTO Order_Information (Order_ID, Customer_ID, Employee_ID, Order_Date, Order_Time, Purchase_Total)
VALUES
    (601,501, 403, '2023-11-06', NOW(), 17.98),
    (602,502, 401, '2023-11-04', NOW(), 15.99),
    (603,503, 404, '2023-11-01', NOW(), 29.97);

-- Insert data into Shipping_Information table
INSERT INTO Shipping_Information (Shipment_ID, Shipment_Date, Shipment_Time, Shipping_Status, Customer_ID, Location_ID, Order_ID)
VALUES
    (701,'2023-11-7', NOW(), 'Shipped', 502, 301, 601),
    (702,'2023-11-6', NOW(), 'Shipped', 501, 302, 602),
    (703,'2023-11-7', NOW(), 'Completed', 503, 303, 603);

-- Insert data into Supplier_Information table
INSERT INTO Supplier_Information (Supplier_ID, Stock_ID, Supplier_Postcode, Supplier_Country, Supplier_City, Min_Order_QTY, Contact_Email)
VALUES
    (801,201, 'IP6 2WA', 'England', 'Ipswich', 10, 'Clownfishproviders@example.com'),
    (802,202, 'CM6 4RD', 'England', 'Chelmsford', 20, 'Goldfishextraction@example.com'),
    (803,203, 'CO7 9EW', 'England', 'Colchester', 30, 'Pufferfishandpals@example.com');

-- Insert data into Order_Items table
INSERT INTO Order_Items (Stock_ID, Order_ID, Order_Quantity)
VALUES
    (201, 603,3),
    (202,602,1),
    (203,601,2);

-- Commit the changes
COMMIT;