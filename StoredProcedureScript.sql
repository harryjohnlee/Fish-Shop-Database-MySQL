
DELIMITER //
CREATE PROCEDURE Update_Efficiencies(
    IN employeeID INT,
    IN newWorkingProductivity DECIMAL(5, 2),
    IN newPackagingEfficiency DECIMAL(5, 2)
)
BEGIN
    IF (SELECT COUNT(*) FROM Employee_Information WHERE Employee_ID = employeeID) THEN
        UPDATE Employee_Information
        SET
            Working_Productivity = newWorkingProductivity,
            Packaging_Efficiency = newPackagingEfficiency
        WHERE Employee_ID = employeeID;
        
        SELECT CONCAT('Efficiency has been updated on ',NOW()) AS Status;
    ELSE
        SELECT 'Employee not found' AS Status;
    END IF;
END //

DELIMITER ;

-- To call the created stored procedures
CALL Update_Efficiencies(401,0.5,0.5);