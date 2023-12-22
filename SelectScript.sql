-- The following SELECT shows that by using the customers first and last name, the shipping status can be retrieved
SELECT
    Customer_Information.First_Name,
    Customer_Information.Last_Name,
    Order_Information.Order_ID,
    Order_Information.Purchase_Total,
    Shipping_Information.Shipping_Status
FROM
    Customer_Information
INNER JOIN
    Order_Information ON Customer_Information.Customer_ID = Order_Information.Customer_ID
INNER JOIN
    Shipping_Information ON Order_Information.Order_ID = Shipping_Information.Order_ID
WHERE
    Customer_Information.First_Name = 'Marco' AND Customer_Information.Last_Name = 'Polo'; 

-- The following SELECT shows that by using the customers first and last name, the user can find the species that was ordered.
SELECT
    Customer_Information.First_Name,
    Customer_Information.Last_Name,
    Order_Items.Order_Quantity,
    Fish_in_Stock.Species
FROM
    Customer_Information
INNER JOIN
    Order_Information ON Customer_Information.Customer_ID = Order_Information.Customer_ID
INNER JOIN
    Order_Items ON Order_Information.Order_ID = Order_Items.Order_ID
INNER JOIN
    Fish_in_Stock ON Order_Items.Stock_ID = Fish_in_Stock.Stock_ID
WHERE
    Customer_Information.First_Name = 'Marco' 
    AND Customer_Information.Last_Name = 'Polo';

-- The following code will search an Order_ID in the database to create a management view of how long the order has been in processing.

SELECT
    Order_Information.Order_ID,
    Order_Information.Order_Date,
    CONCAT(Employee_Information.First_Name, ' ', Employee_Information.Last_Name) AS Employee_Name,
    CONCAT(Employee_Information.Packaging_Efficiency * 100, '%') AS Packaging_Efficiency,
    CONCAT(DATEDIFF(Shipping_Information.Shipment_Date,Order_Information.Order_Date),' Days') AS Completion_Time,
    Shipping_Information.Shipping_Status
FROM
    Employee_Information
INNER JOIN
    Order_Information ON Employee_Information.Employee_ID = Order_Information.Employee_ID
INNER JOIN
    Shipping_Information ON Order_Information.Order_ID = Shipping_Information.Order_ID
WHERE
    Order_Information.Order_ID = '603';