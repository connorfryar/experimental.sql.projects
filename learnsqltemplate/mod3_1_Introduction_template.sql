-------------------------------------------------------------------
/* -------------------- Introduction to SQL -------------------- */
-------------------------------------------------------------------

------------------------- Create Database -------------------------
-- CREATE DATABASE database_name;



-------------------------- Drop Database --------------------------
-- DROP DATABASE database_name;



--------------------------- Create Table --------------------------
/* CREATE TABLE table_name	(attribute_1 data_type_1,
							attribute_2 data_type_2,
							...
							attribute_n data_type_n,
							<integrity_constraint_1>,
							<...>,
							<integrity_constraint_m>); */



--------------------------- Drop Table ----------------------------
-- DROP TABLE table_name;



------------------- Inserting Tuples into Tables ------------------
/* INSERT INTO table_name (att_1, ..., att_n)
   VALUES 	(value_1, ..., value_n);	*/



------------------- Deleting Tuples from Tables -------------------
-- DELETE FROM table_name;



------------- Create Table with Primary Key Constraint ------------
-- CONSTRAINT consName PRIMARY KEY ( attName_1, …, attName_n )



------------- Create Table with Foreign Key Constraint ------------
/* CONSTRAINT consName FOREIGN KEY (local_att(s))
   REFERENCES foreign_table (foreign_att(s))	*/



----------------------- Not Null Constraint -----------------------
-- attributeName dataType NOT NULL



----------------------- Check Constraints -------------------------



------------------- Default Attribute Values ----------------------



----------------------- Updating Relations ------------------------
/* UPDATE 	table_name
   SET		condition/action
   WHERE 	predicate;	*/



----------------------- Altering Relations ------------------------
/* ALTER TABLE table_name ADD att_name data_type;
   ALTER TABLE table_name DROP attribute_name;

   ALTER TABLE table_name ADD constraintName
   ALTER TABLE table_name DROP constraintName	*/
