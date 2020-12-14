CALL apoc.load.json("file:///job/steps/pcs/layers/top/features.json")
YIELD value
UNWIND value AS feature
MATCH (l:Layer) WHERE l.name='top'
MERGE (f:Feature {nf: feature.nf,
                  polarity: feature.polarity,
                  type: feature.type,
                  limits: feature.limits})
  ON CREATE
  SET f.next = coalesce(feature.next),
  f.symbol = coalesce(feature.symbol),
  f.datum = point(feature.datum),
  f.angle = point(feature.angle)
  MERGE (f)-[:HAS_PARENT]->(l)
  MERGE (g:Geometry {type: feature.geometry.type, uuid: apoc.create.uuid()})
    ON CREATE
    SET g.ps = point(coalesce(feature.geometry.ps)),
        g.pe = point(coalesce(feature.geometry.pe)),
        g.pc = point(coalesce(feature.geometry.pc)),
        g.r = coalesce(feature.geometry.r),
        g.cap = coalesce(feature.geometry.cap)
    MERGE (f)-[:HAS_GEOMETRY]->(g)
