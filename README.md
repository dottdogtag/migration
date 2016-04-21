Migration Procedures:

1. Use SQLPro for MSSQL to generate MySQL statements
2. Use the generated MySQL statements to load data to MySQL database
3. Alter tables in MySQL with alter_table
4. Create relationships in MySQL with mysql_migration_2_relation.sql
5. Create geo_location table with mysql_migration_3_new_geo_location.sql
6. Change the encoding of all tables to utf8
7. Export MySQL database to csv table by table (the first 2 users in the csv has invalid email, please change that to any email with valid format)
8. Run scripts 1~7 in ./script/* to generate rails scripts
9. Run the 7 generated ruby script in Docker to seed PostgreSQL database with exisiting data
	* ssh to pier39
	* mkdir migration
	* cd migration
	* scp the rails script from localhost to pier39
	* docker run to production/staging with bash
	* scp the rails script from inside of the docker container 
	* use rails runner to run the rails script, see that the object count should be the same in the scripts and database

10. Copy legacy images to s3 bucket, see staging for path
11. Create oauth applications in the new server. You may wany to change the uid and secret tot he one used in staging server.
12. Update postgre database auto-increment count with postgresql_migration


Note:

1. Export MSSQL tables: User_Account, User_Profile, DOTT_Device, Pet_Location, Pet_LostFound(change mtext to tinytext), Pet_Profile, User_Pet, Pet_LostFound
2. For Pet_Profile.csv, replace \" with empty string
3. For Pet_LostFound.csv, replace \" with '
4. scp results to docker container, update apt-get, install unzip
5. redeploy server with user confirmable removed
6. user staging-console to remove all AppInstanceLocation, BeaconLocation, Beacon, AppInstance, Ownership, GeoLocation, LostReportFollowing, LostReport, User, Pet
