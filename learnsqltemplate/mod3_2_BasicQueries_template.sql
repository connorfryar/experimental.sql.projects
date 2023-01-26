------------------------------------------------------------
/*				  Queries on Single Relations			  */
------------------------------------------------------------

/* 	SELECT attribute_1, attribute_2, …, attribute_n
	FROM table_name
	WHERE predicate;	*/

--	Query: “Find the names of all instructors.”



--	Query: “Find the department names of all instructors.”



--	Example: ALL



--	Example: DISTINCT



--	Example: *



--	Example: Arithmetic Expressions in the SELECT Clause



/* 	Query: “Find the names of all instructors in the Computer Science department
	who have a salary greater than $70,000.”	*/



-- Note: The logical connectives AND, OR, and NOT can be used in the WHERE clause.

-- Note: The following comparison operators may be used: <, <=, >, >=, =, and <>.

------------------------------------------------------------
/*				 Queries on Multiple Relations			  */
------------------------------------------------------------

/*	SELECT attribute_1, attribute_2, …, attribute_n
	FROM table_name_1, table_name_2, …, table_name_n
	WHERE predicate;	*/

/* Query: “Find the names of all instructors, along with their
	department names and department building name.”		*/



/*	Query: “For all instructors in the university who have taught some course,
	find their names and the course ID of all courses they taught.”		*/



/*	Query: “For all instructors in the Computer Science department who have
	taught some course, find their names and the course ID of all courses they taught.”	*/



/*	In general, the meaning of a SQL query can be understood as follows:

	1. 	Generate a Cartesian product of the relations listed in the from clause.

	2. 	Apply the predicates specified in the where clause on the result of Step 1.

	3. 	For each tuple in the result of Step 2, output the attributes (or results of expressions)
		specified in the select clause.		*/
