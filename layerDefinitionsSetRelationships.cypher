//MATCH (job:Job)
//WITH job MATCH (layer:LayerDefinition)
//MERGE (layer)-[r:HAS_PARENT]->(job)
//RETURN job,layer,r

MATCH (l1:LayerDefinition) WHERE l1.next IS NOT NULL
MATCH (l2:LayerDefinition {name: l1.next})
MERGE (l1)-[r:LAYS_UPON]->(l2)
RETURN l1, l2

MATCH (sm:LayerDefinition) WHERE sm.type = "solder mask" AND sm.context = "board" AND sm.side = "top"
MATCH (top:LayerDefinition) WHERE top.type = "signal" AND top.context = "board" AND top.side = "top"
MERGE (top)-[r:EXPOSED_BY]->(sm)
RETURN sm,top,r

MATCH (sm:LayerDefinition) WHERE sm.type = "solder mask" AND sm.context = "board" AND sm.side = "bottom"
MATCH (bot:LayerDefinition) WHERE bot.type = "signal" AND bot.context = "board" AND bot.side = "bottom"
MERGE (bot)-[r:EXPOSED_BY]->(sm)
RETURN sm,bot,r

MATCH (layer:LayerDefinition) WHERE layer.pierced_by IS NOT NULL
UNWIND layer.pierced_by as drill_name
MATCH (drill:LayerDefinition {name: drill_name})
MERGE (layer)-[r:PIERCED_BY]->(drill)
RETURN layer
