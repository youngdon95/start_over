 drop  database hospitaldb;
 create database hospitaldb;
  use hospitaldb;

--  drop table IF EXISTS patient;
--  drop table IF EXISTS doctor;
--  drop table IF EXISTS nurse;
--  drop table IF EXISTS familyHistory;
--  drop table IF EXISTS Employee;
--  drop table IF EXISTS medication;
--  drop table IF EXISTS disease;
--  drop table IF EXISTS procedural;
--  drop table IF EXISTS result;
--  drop table IF EXISTS allergy;
--  drop table IF EXISTS allergicTo;
--  drop table IF EXISTS patientAllergy;
--  drop table IF EXISTS prescribes;
--  drop table IF EXISTS administers;
--  drop table IF EXISTS testResult;
--  drop table IF EXISTS diagnosis;
--  drop table IF EXISTS diseaseTest;

CREATE TABLE patient(
	PID varchar(50) not null, 
	-- unique,
	fname varchar(50) not null,
	lname varchar(50) not null,
	dob date not null,
	address varchar(100) not null,
	cellNum varchar(50) not null,
	homeNum varchar(50) not null,
	Primary Key(PID)
);

CREATE TABLE disease(
	diseaseCode varchar(50) not null unique,
	diagnosis varchar(500) not null,
	treatment varchar(50) not null,
	Primary Key(diseaseCode)
);

CREATE TABLE familyHistory(
	PID varchar(50) not null,
	diseaseCode varchar(60) not null,
	famRelation varchar(50) not null,
	Primary Key(PID),
	Foreign Key (PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(diseaseCode) references disease(diseaseCode) on update cascade on delete cascade
);
				
CREATE TABLE Employee(
	EID varchar(50) not null unique,
	fname varchar(50) not null,
	lname varchar(50) not null,
	cellNum varchar(50) not null,
	emptype varchar(50) not null,
	workNum varchar(50) not null,
	address varchar(100) not null,
	password varchar(30) not null,
	Primary Key(EID)
);		

CREATE TABLE secretary(
	EID varchar(50) not null,
	-- emptype varchar(50) not null,
	role varchar(50) not null, 
	Primary Key(EID),
	Foreign Key (EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE doctor(
	EID varchar(50) not null,
	doc_type varchar(30) not null,
	-- emptype varchar(50) not null, 
	Primary Key(EID),
	Foreign Key (EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE intern(
	EID varchar(50) not null,
	emptype varchar(50) not null,
	startDate date not null,
	prospectiveEndDate date not null,
	Primary Key(EID),
	Foreign Key (EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE resident(
	EID varchar(50) not null,
	emptype varchar(50) not null,
	startDate date not null,
	Primary Key(EID),
	Foreign KEY(EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE consultant(
	EID varchar(50) not null,
	emptype varchar(50) not null,
	specialization varchar(50) not null,
	Primary Key(EID),
	Foreign KEY(EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE nurse(
	EID varchar(50) not null,
	-- emptype varchar(50) not null, 
	category varchar(50) not null,
	Primary Key(EID),
	Foreign Key (EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE vitalSign(
	VID varchar(50) not null unique,
	vitals varchar(50) not null,
	Primary Key(VID)
);

CREATE TABLE Medication(
	MID varchar(50) not null unique,
	drugName varchar(50) not null,
	brandDrug varchar(50) not null,
	Primary Key(MID)
);



CREATE TABLE procedural(
	procCode varchar(50) not null unique,
	procName varchar(25) not null,
	Primary Key(procCode));

CREATE TABLE result(
	resultId varchar(25) not null unique,
	description varchar(500) not null,
	Primary Key(resultId)
);
	
CREATE TABLE scanResult(
	resultId varchar(25) not null,
	imageScan varchar(200) not null,
	Primary Key(resultId),
	Foreign Key(resultId) references result(resultId) on update cascade on delete cascade
);

CREATE TABLE allergy(
	AID varchar(25) not null unique,
	allergy_trigger varchar(50) not null,
	Primary Key(AID)
);


CREATE TABLE allergicTo(
	PID varchar(50) not null,
	MID varchar(50) not null,
	reaction varchar(25) not null,
	Primary Key(PID, MID),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(MID) references Medication(MID) on update cascade on delete cascade
); 
	
CREATE TABLE vitalsRecord(
	PID varchar(50) not null,
	EID varchar(50) not null,
	VID varchar(50) not null,
	recordedValue varchar(100) not null,
	date_taken date not null,
	Primary Key(PID,EID,VID),
	Foreign Key (PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key (VID) references vitalSign(VID) on update cascade on delete cascade,
	Foreign Key (EID) references Employee(EID) on update cascade on delete cascade
);

CREATE TABLE registers(
	PID varchar(50) not null,
	EID varchar(50) not null,
	registered_date date not null,
	Primary Key(PID),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(EID) references Employee(EID) on update cascade on delete cascade);		
 
 CREATE TABLE patientAllergy(
 	PID varchar(50) not null,
	AID varchar(25) not null,
	reaction varchar(25) not null,
	Primary Key(PID,AID),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(AID) references allergy(AID) on update cascade on delete cascade
);
		

CREATE TABLE prescribes(
	PID varchar(50) not null,
	EID varchar(50) `not null,
	MID varchar(50) not null,
	date_prescribed date not null,
	Primary Key(PID, EID, MID),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(EID) references Employee(EID) on update cascade on delete cascade,
	Foreign Key(MID) references Medication(MID) on update cascade on delete cascade);

CREATE TABLE administers(
	PID varchar(50) not null,
	EID varchar(50) not null,
	MID varchar(50) not null,
	datedministered date not null,
	Primary Key(PID, EID, MID),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(EID) references Employee(EID) on update cascade on delete cascade,
	Foreign Key(MID) references Medication(MID) on update cascade on delete cascade
);

CREATE TABLE testResult(
	PID varchar(50) not null,
	resultId varchar(25) not null,
	procCode varchar(50) not null,
	diseaseCode varchar(50) not null,
	testDate date not null,
	resultDate date not null,
	Primary Key(PID, resultId,procCode,diseaseCode),
	Foreign Key(PID) references patient(PID) on update cascade on delete cascade,
	Foreign Key(resultId) references result(resultId) on update cascade on delete cascade,
	Foreign Key(procCode) references procedural(procCode) on update cascade on delete cascade,
	Foreign Key(diseaseCode) references disease(diseaseCode) on update cascade on delete cascade
);

CREATE TABLE diagnose(
	EID varchar(50) not null,
	diseaseCode varchar(50) not null,
	PID varchar(50) not null,
	date_diagnosed date not null,
	Primary Key(EID, diseaseCode, PID),
	Foreign Key(EID) references Employee(EID) on update cascade on delete cascade,
	Foreign Key(diseaseCode) references disease(diseaseCode) on update cascade on delete cascade,
	Foreign Key(PID)references patient(PID) on update cascade on delete cascade);

CREATE TABLE requires(
	procCode varchar(50) not null,		
	diseaseCode varchar(50) not null,
	Primary Key(procCode, diseaseCode),
	Foreign Key(procCode) references procedural(procCode) on update cascade on delete cascade,
	Foreign Key(diseaseCode) references disease(diseaseCode) on update cascade on delete cascade
);



