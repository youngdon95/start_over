/*DELIMITER //
	CREATE PROCEDURE resultPatientMedical(IN resultID varchar(25), IN descript varchar(500))

	BEGIN
	IF NOT EXISTS*/
		/*	select * from result where resultId = resultID;
		
	END//
DELIMITER ;*/

/* Insert new result*/
Insert into result (resultId, description)
Select * from (Select @resultID,@descript) AS tmp 
Where NOT exists 
(Select resultId from result where resultId = @resultID) Limit 1;

