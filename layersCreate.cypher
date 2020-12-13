//:param step => "pcs"
MATCH (s:Step {name:"pcs"})
MATCH (ld:LayerDefinition)
WITH ld, s
CREATE (s)<-[:HAS_PARENT]-(layer:Layer {name:ld.name})-[:DEFINED_BY]->(ld)
RETURN layer

// Return list of signal layers pierces by drill layer named "d1-2"
MATCH (l:Layer)-[r:DEFINED_BY]->(ld:LayerDefinition)<-[p:PIERCED_BY]-(s:LayerDefinition)
  WHERE l.name="d1-2"
RETURN l,s
