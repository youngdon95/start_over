/*use to insert patient's medical information by nurse*/

DELIMITER //
	CREATE PROCEDURE nurseInsertPatientMedical(IN EID varchar(50), IN PID varchar(50),
	IN date_administered date,IN MID varchar(50), IN VID varchar(50),
	IN recordedValue varchar(100), IN date_taken date)

	BEGIN

	
	INSERT into administers values (PID,EID,MID,date_administered);

	INSERT into vitalsRecord values (PID,EID,VID,recordedValue,date_taken);
	
	
	
END//
DELIMITER ;

