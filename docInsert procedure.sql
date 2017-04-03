/*use to insert patient's medical information by doctor*/

DELIMITER //
	CREATE PROCEDURE docInsertPatientMedical(IN EID varchar(50), IN PID varchar(50), IN diseaseCode varchar(50), 
	IN date_diagnosed date, IN date_prescribed date, IN MID varchar(50), IN resultId varchar(25),
	IN procCode varchar(50), IN testDate date, IN resultDate date)

	BEGIN

	
	INSERT into diagnose values (EID,diseaseCode,PID,date_diagnosed);

	INSERT into prescribes values (PID,EID,MID,date_prescribed);
	
	
	INSERT into testResult values (PID,resultId,procCode,diseaseCode,testDate,resultDate);
END//
DELIMITER ;

