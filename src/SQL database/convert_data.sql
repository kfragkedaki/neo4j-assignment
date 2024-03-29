/* Convert string 'null' to NULL value */

Update [neo4j].[dbo].[profiles]
SET [user_id] = NULL
WHERE [user_id] = ' null'

Update [neo4j].[dbo].[profiles]
SET [gender] = NULL
WHERE [gender] = ' null'

Update [neo4j].[dbo].[profiles]
SET [age] = NULL
WHERE [age] = ' null'

/* Convert values to integers */

SELECT 
  CONVERT(INT, [user_id]) AS [user_id],
  CONVERT(INT, [gender]) AS [gender],
  CONVERT(INT, [age]) AS [age]
  INTO [neo4j].[dbo].[profile]
  FROM [neo4j].[dbo].[profiles]