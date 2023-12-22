 USE Fish_Shop_Database;

CREATE USER 'user1'@'localhost' IDENTIFIED BY 'abc123';

GRANT SELECT, INSERT, UPDATE, DELETE ON Fish_shop_database.* TO 'user1'@'localhost';

 CREATE TABLE Customer_Location (
    Location_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_City VARCHAR(255) NOT NULL,
    Customer_Postcode VARCHAR(7) NOT NULL,
    Customer_Country VARCHAR(255) NOT NULL,
    Customer_HouseNumber INT NOT NULL
);
CREATE TABLE Fish_in_Stock (
    Stock_ID INT PRIMARY KEY AUTO_INCREMENT,
    Stock_Quantity INT NOT NULL,
    Species VARCHAR(255) NOT NULL,
    Price DECIMAL(9, 2) NOT NULL,
    Freshwater BOOLEAN DEFAULT FALSE,
    Saltwater BOOLEAN DEFAULT FALSE
);
CREATE TABLE Customer_Information (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location_ID INT,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (Location_ID) REFERENCES Customer_Location(Location_ID)
);
CREATE TABLE Employee_Information (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Date_Of_Birth DATE NOT NULL,
    First_Name VARCHAR(255) NOT NULL,
    Last_Name VARCHAR(255) NOT NULL,
    Emergency_Contact_Number BIGINT NOT NULL,
    Working_Productivity DECIMAL(5, 2) NOT NULL,
    Packaging_Efficiency DECIMAL(5, 2) NOT NULL
);
CREATE TABLE Order_Information (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Employee_ID INT,
    Order_Date DATE NOT NULL,
    Order_Time DATETIME NOT NULL,
    Purchase_Total DECIMAL(9, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employee_Information(Employee_ID)
);
CREATE TABLE Shipping_Information (
    Shipment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Shipment_Date DATE NOT NULL,
    Shipment_Time DATETIME NOT NULL,
    Shipping_Status VARCHAR(255) NOT NULL,
    Customer_ID INT,
    Location_ID INT,
    Order_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer_Information(Customer_ID),
    FOREIGN KEY (Location_ID) REFERENCES Customer_Location(Location_ID),
    FOREIGN KEY (Order_ID) REFERENCES Order_Information(Order_ID)

);
CREATE TABLE Supplier_Information (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Stock_ID INT,
    Supplier_Postcode VARCHAR(7) NOT NULL,
    Supplier_Country VARCHAR(255) NOT NULL,
    Supplier_City VARCHAR(255) NOT NULL,
    Min_Order_QTY INT NOT NULL,
    Contact_Email VARCHAR(255) NOT NULL
);
CREATE TABLE Order_Items (
    Stock_ID INT,
    Order_ID INT,
    Order_Quantity INT NOT NULL,
    PRIMARY KEY (Stock_ID, Order_ID),
    FOREIGN KEY (Stock_ID) REFERENCES Fish_in_Stock(Stock_ID),
    FOREIGN KEY (Order_ID) REFERENCES Order_Information(Order_ID)
);

CREATE VIEW Emergency_Workplace_Accident AS
SELECT First_Name, Last_Name, Emergency_Contact_Number 
FROM Employee_Information;

CREATE VIEW Entitled_Bonus AS
SELECT First_Name, Last_Name, Working_Productivity, Packaging_Efficiency
FROM Employee_Information
WHERE Working_Productivity >= 0.5 AND Packaging_Efficiency >= 0.7
ORDER BY Working_Productivity+Packaging_Efficiency DESC; DELETE ON Fish_shop_database.* TO 'user1'@'localhost';
