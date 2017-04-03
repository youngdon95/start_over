DELIMITER //

    CREATE PROCEDURE diagnosisDate(IN Date1 date, IN Date2 date)
    
    BEGIN

        Select fname, lname from patient JOIN diagnose ON patient.PID = diagnose.PID where 
        date_diagnosed BETWEEN Date1 AND Date2;
        
    END//
DELIMITER ;