//:param "name" => "pcs"
CALL apoc.load.json("file:///steps/pcs/profile.json")
YIELD value
MATCH (s:Step {name:"pcs"})
WITH p.profile_id AS id
MERGE (p)-[r:HAS_PROFILE]->(s:Shape:Contour {id: id})
