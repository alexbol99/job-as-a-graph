LOAD CSV WITH HEADERS FROM 'file:///steps.csv' AS line
MERGE (s:Step { name: line.Name })
RETURN count(s);

LOAD CSV WITH HEADERS FROM 'file:///steps.csv' AS line
MATCH (s:Step {name: line.Name})
MATCH (j:Job {name: line.Parent})
MERGE (s)-[r:HAS_PARENT]->(j)
RETURN count(*)
