MATCH (j:Job)
MATCH (s:Step)
MERGE (s)-[r:HAS_PARENT]->(j)
RETURN j,s,r
