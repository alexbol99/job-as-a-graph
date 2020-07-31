LOAD CSV WITH HEADERS FROM 'file:///layers.csv' AS line
MERGE (l:Layer { name: line.Name, type: line.Type, context: line.Context, side: line.Side })
SET l.polarity = CASE trim(line.Polarity) WHEN "" THEN null ELSE line.Polarity END
RETURN count(l);

LOAD CSV WITH HEADERS FROM 'file:///layers.csv' AS line
MATCH (l1:Layer {name: line.Name})
MATCH (l2:Layer {name: line.Next})
MERGE (l1)-[r:HAS_NEXT]->(l2)
RETURN count(*);
