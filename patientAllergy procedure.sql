DELIMITER //

    CREATE PROCEDURE diagnosisDate(IN firstname varchar(50), IN lastname varchar(50))
    
    BEGIN

        Select allergy from patientAllergy JOIN patient ON patient.PID = patientAllergy.PID where 
        fname = firstname AND lname = lastname;
        
    END//
DELIMITER ;