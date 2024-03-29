/* Query 1: For each user, count his/her friends 
   Run Time: 18 sec */

SELECT [node1], Count([node2]) AS Friends
  FROM [neo4j].[dbo].[relationships]
  GROUP BY [node1]

/* Query 2: For each user, count his/her friends of friends
   Run Time: 7 min 13 sec */

SELECT relationships1.[node1], relationships1.[node2], Count(relationships2.[node2]) AS Friends
  FROM [neo4j].[dbo].[relationships] AS relationships1
  LEFT JOIN [neo4j].[dbo].[relationships] AS relationships2
  ON relationships1.[node2] = relationships2.[node1]
  GROUP BY relationships1.[node1], relationships1.[node2]

/* Query 3: For each user, count his/her friends that are over 30
   Run Time: 30 sec */

SELECT [node1], COUNT(CASE WHEN profiles.age > 30 
		           THEN node2 END) AS Friends
  FROM [neo4j].[dbo].[relationships] AS relationships
  LEFT JOIN [neo4j].[dbo].[profile] AS profiles
  ON profiles.user_id = relationships.node2
  GROUP BY [node1]

/* Query 4: For each male user, count how many male 
	    and female friends he is having
   Run Time: 26 sec */

SELECT [node1], profiles2.[gender] AS gender, 
		Count(relationships.[node2]) AS Friends
  FROM [neo4j].[dbo].[relationships] AS relationships
  LEFT JOIN [neo4j].[dbo].[profile] AS profiles1
  ON profiles1.user_id = relationships.node1
  LEFT JOIN [neo4j].[dbo].[profile] AS profiles2
  ON profiles2.user_id = relationships.node2
  GROUP BY [node1], profiles1.[gender], profiles2.gender
  HAVING profiles1.[gender] = 1