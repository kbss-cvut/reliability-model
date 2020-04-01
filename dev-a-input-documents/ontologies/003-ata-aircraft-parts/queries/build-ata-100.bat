tarql -q --ntriples groups.sparql ..\ata-groups.csv | riot --out=TTL > ..\ata-groups.ttl
tarql -q --ntriples chapters.sparql ..\ata-chapters.csv | riot --out=TTL > ..\ata-chapters.ttl
tarql -q --ntriples sections.sparql ..\ata-sections.csv | riot --out=TTL > ..\ata-sections.ttl

riot ..\ata-groups.ttl ..\ata-chapters.ttl ..\ata-sections.ttl > ..\ata-100.ttl



