--------------------------------------------------------------
/*					  Aggregate Functions		  			*/
--------------------------------------------------------------

/* Loose Definition of Aggregation:	Transforming detailed information
									into summative information	*/

-- 	Basic Aggregate Functions

	/*	The five basic aggregate functions are:

		Average:	AVG( )
		Minimum:	MIN( )
		Maximum:	MAX( )
		Total:		SUM( )
		Count:		COUNT( )		*/

	/*	Query: “Find the average salary of instructors in the
		Computer Science department.”	*/

		

	/*	Query: “Find the total number of instructors who taught a course
		in the Spring 2009 semester.”	*/

		

	--	We can use COUNT to simply count the number of tuples in a relation:

		

-- Aggregation by Grouping

	-- 	Query: “Find the average salary of instructors in each department.”

		

	/*	Query: “Find the number of instructors in each department who teach
		a course in the Spring 2009 semester.”		*/

		

	/* 	ERRONEOUS QUERY */

		

-- The Having Clause

	/*	Query: “Find the name of each department and the average salary
		of instructors in each department only for departments having
		an average salary greater than $42,000.”		*/

		

	/*	The meaning of a query containing aggregation, GROUP BY, or HAVING clauses
		is defined by the following sequence of operations:

		1.	As was the case for queries without aggregation, the FROM clause is first
			evaluated to get a relation.

		2.	If a WHERE clause is present, the predicate in the WHERE clause is applied
			on each tuple in the result relation of the FROM clause.

		3.	Tuples satisfying the WHERE predicate are then placed into groups by the
			GROUP BY clause if it is present.  If the GROUP BY clause is absent, the entire
			set of tuples satisfying the WHERE predicate is treated as being in one group.

		4.	The HAVING clause, if it is present, is applied to each group; the groups
			that do not satisfy the having clause predicate are removed.

		5.	The SELECT clause uses the remaining groups to generate tuples of the result
			of the query, applying the aggregate functions to get a single result tuple for
			each group.				*/

	/*	Query: “For each course section offered in 2009, find the average total credits
		(tot_cred) of all students enrolled in the section, if the section has at least
		2 students.”		*/

		


















