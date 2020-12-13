CALL apoc.load.json("file:///job/matrix/layers.json")
YIELD value
UNWIND value AS layer
MERGE (l:LayerDefinition {name: layer.name, type: layer.type, context: layer.context})
  ON CREATE
  SET l.side = CASE trim(layer.side) WHEN "" THEN null ELSE layer.side END,
  l.polarity = CASE trim(layer.polarity) WHEN "" THEN null ELSE layer.polarity END,
  l.drill_type = CASE trim(layer.drill_type) WHEN "" THEN null ELSE layer.drill_type END,
  l.next = CASE trim(layer.next) WHEN "" THEN null ELSE layer.next END,
  l.from = CASE trim(layer.from) WHEN "" THEN null ELSE layer.from END,
  l.to = CASE trim(layer.to) WHEN "" THEN null ELSE layer.to END,
  l.pierced_by = CASE layer.pierced_by WHEN NULL then null ELSE layer.pierced_by END
