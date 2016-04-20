Migration Procedures:

1. Use SQLPro for MSSQL to generate MySQL statements
2. Create tables in MySQL with mysql_migration_1_create.sql
3. Use the generated MySQL statements to load data to MySQL database
4. Create relationships in MySQL with mysql_migration_2_relation.sql
5. Create geo_location table with mysql_migration_3_new_geo_location.sql
6. Change the encoding of all tables to utf8
7. Export MySQL database to csv table by table
8. Run scripts 1~7 in ./script/* to generate ruby scripts
9. Run the 7 generated ruby script in Docker to seed PostgreSQL database with exisiting data
10. Copy legacy images to s3 bucket, see staging for path
11. Create oauth applications in the new server. You may wany to change the uid and secret tot he one used in staging server.
