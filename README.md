# ClinicTrials2015

The CTTI (Clinical Trials Transformation Initiative) provides their clinical trials data extracts available as a relational database to facilitate the analysis of the set of trials. As such, the purpose of this project is to create a relational database for the clinical trials and load the files into the tables. This project will be done solely with T-SQL, without any BI tools for ETL operations. 

The downloads made available and required for this project are: 

1) the flat files containing the data (pipe delimited text output)  
2) an Excel file containing the comprehensive data dictionary required to start this project.


# Steps 
(code in clinicaltrials.sql for more details)

1. Download and prepare the data (downloads available at https://www.ctti-clinicaltrials.org/aact-database)
2. Create the tables (as there are 43 flat files, there will be 43 tables to create)
   - go over the data dictionary for reference concerning the table names, column names, data types, the number of records, etc
   - best to name the tables similarly to their respective flat files' filenames to facilitate the ETL process in the next step
3. Load the flat files into the created tables
   - use bulk insert method to load data into the tables
   - for efficiency and faster work done, write a dynamic SQL to automatically generate the bulk insert for all tables, instead of manually writing a bulk insert for each table
     - use 'INFORMATION_SCHEMA.TABLES'to get the list of table names (and hence file names) to use in the dynamic SQL
   - once dynamic SQL generates the bulk insert statements, copy and paste them all and run them all 
4. Verify the table loads by comparing the number of rows inserted with the number of rows indicated in the data dictionary
5. Set the primary key and foreign key constraints using the data dictionary Excel file as reference 
