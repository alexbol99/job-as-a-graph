MATCH (j:Job) DETACH DELETE j RETURN count(j)

MATCH(s:Step) DETACH DELETE s RETURN count(s)

MATCH(p:Profile) DETACH DELETE p RETURN count(p)

MATCH (l:LayerDefinition) DETACH DELETE l RETURN count(l)

MATCH (l:Layer) DETACH DELETE l RETURN count(l)

MATCH (f:Feature) DETACH DELETE f RETURN count(f)

MATCH (g:Geometry) DETACH DELETE g RETURN count(g)

MATCH (n) DETACH DELETE n RETURN count(n)
