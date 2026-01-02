/*
CREATING DATABASE AND SCEHMAS:
Script Purpose:
	This script created a new database 'Datawarehouse' after cehcking if it already exists. 
	If the database exists, it is dropped and recreated. Additionally, the script sets up three
	scehmas within the databse: bronze, silver and gold.

Caution:
	Running this script will drop the 'Datawarehouse' database if it exists. All data in the 
	database will be permanently deleted. Proceed with caution and ensure you have proper backups 
	running the script.
*/

USE master;
GO

if exists(select 1 from sys.databases where name = 'DataWarehouse')
begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse;
end;
GO

create database DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

/*What is SINGLE_USER mode?
Allows only ONE connection to the database
Kicks out all other users/sessions

What does WITH ROLLBACK IMMEDIATE do?
Instantly terminates active connections
Rolls back any uncommitted transactions
No waiting, no hanging locks

Why is this needed?
If any user (or tool) is connected to the database:
DROP DATABASE will fail
You’ll get errors like:
Database is currently in use
*/
