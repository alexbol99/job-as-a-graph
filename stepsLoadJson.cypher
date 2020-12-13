CALL apoc.load.json("file:///job/matrix/steps.json")
YIELD value
UNWIND value AS step
MERGE (s:Step {name: step.name})
  ON CREATE
  SET s.profile_id = CASE step.has_profile WHEN true THEN apoc.create.uuid() ELSE null END
