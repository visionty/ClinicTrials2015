CREATE DATABASE ClinicalTrials;

USE ClinicalTrials; 
GO

CREATE TABLE arm_groups (
   ARM_GROUP_ID int NOT NULL,
   NCT_ID varchar(11) NOT NULL,
   ARM_GROUP_LABEL varchar(200) NULL,
   ARM_GROUP_TYPE varchar(20) NULL,
   DESCRIPTION varchar(2000) NULL,
   GROUP_ID varchar(3) NULL
) 
GO

CREATE TABLE authorities (
   AUTHORITY_ID int not NULL,
   NCT_ID nvarchar(51) NOT NULL,
   AUTHORITY nvarchar(300) NULL
) 
GO

CREATE TABLE centralcontacts (
   CENTRAL_CONTACT_ID int not NULL,
   NCT_ID nvarchar(50) NOT NULL,
   CONTACT_TYPE nvarchar(100) NULL,
   NAME_DEGREE nvarchar(150) NULL,
   PHONE nvarchar(50) NULL,
   PHONE_EXT nvarchar(50) NULL,
   EMAIL nvarchar(200) NULL
) 
GO

CREATE TABLE clinical_study (
   NCT_ID nvarchar(100) not NULL,
   DOWNLOAD_DATE nvarchar(400) NULL,
   DOWNLOAD_DATE_DT date NULL,
   ORG_STUDY_ID nvarchar(200) NULL,
   BRIEF_TITLE nvarchar(1000) NULL,
   OFFICIAL_TITLE nvarchar(1000) NULL,
   ACRONYM nvarchar(400) NULL,
   SOURCE nvarchar(400) NULL,
   HAS_DMC nvarchar(50) NULL,
   BRIEF_SUMMARY nvarchar(max) NULL,
   DETAILED_DESCRIPTION nvarchar(max) NULL,
   OVERALL_STATUS nvarchar(400) NULL,
   START_DATE nvarchar(100) NULL,
   COMPLETION_DATE nvarchar(100) NULL,
   COMPLETION_DATE_TYPE nvarchar(100) NULL,
   PRIMARY_COMPLETION_DATE nvarchar(100) NULL,
   PRIMARY_COMPLETION_DATE_TYPE nvarchar(100) NULL,
   PHASE nvarchar(100) NULL,
   STUDY_TYPE nvarchar(200) NULL,
   STUDY_DESIGN nvarchar(2000) NULL,
   NUMBER_OF_ARMS int NULL,
   NUMBER_OF_GROUPS int NULL,
   ENROLLMENT_TYPE nvarchar(50) NULL,
   ENROLLMENT int NULL,
   BIOSPEC_RETENTION nvarchar(100) NULL,
   BIOSPEC_DESCR nvarchar(2000) NULL,
   CRITERIA nvarchar(max) NULL,
   GENDER nvarchar(50) NULL,
   MINIMUM_AGE nvarchar(100) NULL,
   MAXIMUM_AGE nvarchar(100) NULL,
   HEALTHY_VOLUNTEERS nvarchar(100) NULL,
   SAMPLING_METHOD nvarchar(200) NULL,
   STUDY_POP nvarchar(2000) NULL,
   VERIFICATION_DATE nvarchar(100) NULL,
   LASTCHANGED_DATE nvarchar(100) NULL,
   FIRSTRECEIVED_DATE nvarchar(100) NULL,
   IS_SECTION_801 nvarchar(100) NULL,
   IS_FDA_REGULATED nvarchar(100) NULL,
   WHY_STOPPED nvarchar(1000) NULL,
   HAS_EXPANDED_ACCESS nvarchar(100) NULL,
   FIRSTRECEIVED_RESULTS_DATE nvarchar(100) NULL,
   URL nvarchar(200) NULL,
   TARGET_DURATION nvarchar(50) NULL,
   STUDY_RANK nvarchar(50) NULL,
   LIMITATIONS_AND_CAVEATS nvarchar(max) NULL
)
GO


CREATE TABLE conditions (
   CONDITION_ID int not NULL,
   NCT_ID nvarchar(50) NOT NULL,
   CONDITION nvarchar(200) NULL
) 
GO

CREATE TABLE designs (
   DESIGN_ID int not NULL,
   NCT_ID nvarchar(50) NOT NULL,
   DESIGN_NAME nvarchar(50) NULL,
   DESIGN_VALUE nvarchar(100) NULL,
   MASKED_ROLE nvarchar(100) NULL
) 
GO

CREATE TABLE facilities (
   FACILITY_ID int not NULL,
   NCT_ID nvarchar(50) NOT NULL,
   STATUS nvarchar(50) NULL,
   FACILITY_NAME nvarchar(500) NULL,
   CITY nvarchar(200) NULL,
   STATE nvarchar(100) NULL,
   ZIP nvarchar(100) NULL,
   COUNTRY nvarchar(100) NULL
) 
GO

CREATE TABLE facility_contacts (
   FACILITY_CONTACT_ID int not NULL,
   FACILITY_ID int NULL,
   NCT_ID nvarchar(50) NOT NULL,
   CONTACT_TYPE nvarchar(50) NULL,
   NAME_DEGREE nvarchar(300) NULL,
   PHONE nvarchar(100) NULL,
   PHONE_EXT nvarchar(50) NULL,
   EMAIL nvarchar(200) NULL
) 
GO


-- Write a dynamic SQL code to generate a bulk insert for each table. Run it. --

select 'EXECUTE('''+char(13)+'bulk insert '+ table_name +' from ' +''''+'''''+@DATADIR +'''+ table_name +'.txt''''' 
+' with (fieldterminator='+''''+'''|'''+''''+','+char(13)+'rowterminator='+''''+'''\n'''+''''+','+char(13)+'firstrow = 2)'''+')'
from [INFORMATION_SCHEMA].[TABLES]

-- declare variable for files path --

DECLARE @DATADIR varchar(128)
SET @DATADIR ='C:\SQL2014\Projects\CinicalTrials\AACT201403Refresher_Pipe_delimited_txt\';

-- copy and paste the bulk inserts generated AFTER the variable declaration and assignment. Select them all and run them. 
-- The code below should be what the dynamic SQL generates

EXECUTE('
bulk insert arm_groups from '''+@DATADIR +'arm_groups.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert clinical_study from '''+@DATADIR +'clinical_study.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert conditions from '''+@DATADIR +'conditions.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert designs from '''+@DATADIR +'designs.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert facilities from '''+@DATADIR +'facilities.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert facility_contacts from '''+@DATADIR +'facility_contacts.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert authorities from '''+@DATADIR +'authorities.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert centralcontacts from '''+@DATADIR +'centralcontacts.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')

-- set primary key constraints on tables --

ALTER TABLE arm_groups 
ADD CONSTRAINT PK_ARM_GROUPS PRIMARY KEY (ARM_GROUP_ID);

ALTER TABLE authorities 
ADD CONSTRAINT PK_AUTHORITIES PRIMARY KEY (AUTHORITY_ID);

ALTER TABLE centralcontacts 
ADD CONSTRAINT PK_CENTRAL_CONTACTS PRIMARY KEY (CENTRAL-CONTACT_ID);

ALTER TABLE clinical_study 
ADD CONSTRAINT PK_CLINICAL_STUDIES PRIMARY KEY (NCT_ID);

ALTER TABLE conditions 
ADD CONSTRAINT PK_CONDITIONS PRIMARY KEY (CONDITION_ID);

ALTER TABLE designs 
ADD CONSTRAINT PK_DESIGNS PRIMARY KEY (DESIGN_ID);

ALTER TABLE facilities 
ADD CONSTRAINT PK_FACILITIES PRIMARY KEY (FACILITY_ID);

ALTER TABLE facility_contacts 
ADD CONSTRAINT PK_FACILITY_CONTACT PRIMARY KEY (FACILITY_CONTACT_ID);

-- set foreign key constraints on tables -- 

ALTER TABLE arm_groups
ADD CONSTRAINT FK_arm_groups
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);

ALTER TABLE authorities
ADD CONSTRAINT FK_AUTHORITIES
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);


ALTER TABLE centralcontacts
ADD CONSTRAINT FK_CENTRAL_CONTACTS
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);

ALTER TABLE conditions
ADD CONSTRAINT FK_CONDITIONS
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);


ALTER TABLE designs
ADD CONSTRAINT FK_DESIGNS
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);


ALTER TABLE FACILITIES
ADD CONSTRAINT FK_FACILITIES
FOREIGN KEY (NCT_ID) REFERENCES CLINICAL_STUDY (NCT_ID);


ALTER TABLE facility_contacts
ADD CONSTRAINT FK_FACILITY_CONTACTS
FOREIGN KEY (FACILITY_ID) REFERENCES FACILITIES (FACILITY_ID);





