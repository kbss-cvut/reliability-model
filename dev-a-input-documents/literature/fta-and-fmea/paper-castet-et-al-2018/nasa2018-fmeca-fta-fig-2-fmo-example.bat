cmd /C tarql nasa2018-fmeca-fta-fig-2-fmo-example-nodes.sparql > nasa2018-fmeca-fta-fig-2-fmo-example-nodes.ttl 
cmd /C tarql --ntriples nasa2018-fmeca-fta-fig-2-fmo-example-edges.sparql > nasa2018-fmeca-fta-fig-2-fmo-example-edges.nt
jena-cmd.bat & ^
riot --output=TTL --formatted=TTL nasa2018-fmeca-fta-fig-2-fmo-example-nodes.ttl nasa2018-fmeca-fta-fig-2-fmo-example-edges.nt > nasa2018-fmeca-fta-fig-2-fmo-example.ttl