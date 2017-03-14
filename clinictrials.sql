CREATE DATABASE ClinicalTrials;

USE ClinicalTrials; 
GO

--create the tables (should be 43 tables, but for demo purposes, code shown will only limit to 10 tables)--


CREATE TABLE arm_groups (
   ARM_GROUP_ID int NULL,
   NCT_ID varchar(11) NULL,
   ARM_GROUP_LABEL varchar(200) NULL,
   ARM_GROUP_TYPE varchar(20) NULL,
   DESCRIPTION varchar(2000) NULL,
   GROUP_ID varchar(3) NULL
) ON PRIMARY
GO

CREATE TABLE authorities (
   AUTHORITY_ID int not NULL,
   NCT_ID nvarchar(51) NULL,
   AUTHORITY nvarchar(300) NULL
) ON PRIMARY
GO

CREATE TABLE centralcontacts (
   CENTRAL_CONTACT_ID int not NULL,
   NCT_ID nvarchar(50) NULL,
   CONTACT_TYPE nvarchar(100) NULL,
   NAME_DEGREE nvarchar(150) NULL,
   PHONE nvarchar(50) NULL,
   PHONE_EXT nvarchar(50) NULL,
   EMAIL nvarchar(200) NULL
) ON PRIMARY
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
) ON PRIMARY
GO

CREATE TABLE clinical_study_noclob (
   NCT_ID nvarchar(50) NULL,
   DOWNLOAD_DATE nvarchar(100) NULL,
   DOWNLOAD_DATE_DT datetime NULL,
   ORG_STUDY_ID nvarchar(50) NULL,
   BRIEF_TITLE nvarchar(600) NULL,
   OFFICIAL_TITLE nvarchar(1000) NULL,
   ACRONYM nvarchar(50) NULL,
   SOURCE nvarchar(300) NULL,
   HAS_DMC nvarchar(10) NULL,
   OVERALL_STATUS nvarchar(50) NULL,
   START_DATE datetime NULL,
   COMPLETION_DATE datetime NULL,
   COMPLETION_DATE_TYPE nvarchar(30) NULL,
   PRIMARY_COMPLETION_DATE datetime NULL,
   PRIMARY_COMPLETION_DATE_TYPE nvarchar(30) NULL,
   PHASE nvarchar(30) NULL,
   STUDY_TYPE nvarchar(100) NULL,
   STUDY_DESIGN nvarchar(500) NULL,
   NUMBER_OF_ARMS int NULL,
   NUMBER_OF_GROUPS int NULL,
   ENROLLMENT_TYPE nvarchar(50) NULL,
   ENROLLMENT int NULL,
   BIOSPEC_RETENTION nvarchar(50) NULL,
   BIOSPEC_DESCR nvarchar(2000) NULL,
   GENDER nvarchar(20) NULL,
   MINIMUM_AGE nvarchar(20) NULL,
   MAXIMUM_AGE nvarchar(20) NULL,
   HEALTHY_VOLUNTEERS nvarchar(60) NULL,
   SAMPLING_METHOD nvarchar(50) NULL,
   STUDY_POP nvarchar(3000) NULL,
   VERIFICATION_DATE datetime NULL,
   LASTCHANGED_DATE datetime NULL,
   FIRSTRECEIVED_DATE datetime NULL,
   IS_SECTION_801 nvarchar(10) NULL,
   IS_FDA_REGULATED nvarchar(10) NULL,
   WHY_STOPPED nvarchar(300) NULL,
   HAS_EXPANDED_ACCESS nvarchar(10) NULL,
   FIRSTRECEIVED_RESULTS_DATE datetime NULL,
   URL nvarchar(100) NULL,
   TARGET_DURATION nvarchar(max) NULL,
   STUDY_RANK int NULL,
   LIMITATIONS_AND_CAVEATS nvarchar(4000) NULL
) ON PRIMARY TEXTIMAGE_ON PRIMARY
GO


CREATE TABLE conditions (
   CONDITION_ID int not NULL,
   NCT_ID nvarchar(50) NULL,
   CONDITION nvarchar(200) NULL
) ON PRIMARY
GO

CREATE TABLE designs (
   DESIGN_ID int not NULL,
   NCT_ID nvarchar(50) NULL,
   DESIGN_NAME nvarchar(50) NULL,
   DESIGN_VALUE nvarchar(100) NULL,
   MASKED_ROLE nvarchar(100) NULL
) ON PRIMARY
GO

CREATE TABLE facilities (
   FACILITY_ID int not NULL,
   NCT_ID nvarchar(50) NULL,
   STATUS nvarchar(50) NULL,
   FACILITY_NAME nvarchar(500) NULL,
   CITY nvarchar(200) NULL,
   STATE nvarchar(100) NULL,
   ZIP nvarchar(100) NULL,
   COUNTRY nvarchar(100) NULL
) ON PRIMARY
GO

CREATE TABLE facility_contacts (
   FACILITY_CONTACT_ID int not NULL,
   FACILITY_ID int NULL,
   NCT_ID nvarchar(50) NULL,
   CONTACT_TYPE nvarchar(50) NULL,
   NAME_DEGREE nvarchar(300) NULL,
   PHONE nvarchar(100) NULL,
   PHONE_EXT nvarchar(50) NULL,
   EMAIL nvarchar(200) NULL
) ON PRIMARY
GO


-- Write a dynamic SQL code to generate a bulk insert for each table. Run it. --

select 'EXECUTE('''+char(13)+'bulk insert '+ table_name +' from ' +''''+'''''+@DATADIR +'''+ table_name +'.txt''''' 
+' with (fieldterminator='+''''+'''|'''+''''+','+char(13)+'rowterminator='+''''+'''\n'''+''''+','+char(13)+'firstrow = 2)'''+')'
from [INFORMATION_SCHEMA].[TABLES]

-- declare variable for files path --

DECLARE @DATADIR varchar(128)
SET @DATADIR ='C:\SQL2014\Projects\CinicalTrials\AACT201403Refresher_Pipe_delimited_txt\'

-- copy and paste the bulk inserts generated AFTER the variable declaration and assignment. Select them all and run them. --

EXECUTE('
bulk insert arm_groups from '''+@DATADIR +'arm_groups.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert clinical_study from '''+@DATADIR +'clinical_study.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert clinical_study_noclob from '''+@DATADIR +'clinical_study_noclob.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')
EXECUTE('
bulk insert condition_browse from '''+@DATADIR +'condition_browse.txt'' with (fieldterminator=''|'',
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
bulk insert centralcontacts from '''+@DATADIR +'central_contacts.txt'' with (fieldterminator=''|'',
rowterminator=''\n'',
firstrow = 2)')


