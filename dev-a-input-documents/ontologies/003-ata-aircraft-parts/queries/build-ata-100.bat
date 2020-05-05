@echo off

call tarql -q sections.sparql ..\ata-sections.csv > ..\ata-sections.ttl
call tarql -q --ntriples chapters.sparql ..\ata-chapters.csv > ..\ata-chapters.n3
call tarql -q --ntriples groups.sparql ..\ata-groups.csv > ..\ata-groups.n3

call jena-cmd.bat
call riot --output=TTL --formatted=TTL ..\ata-sections.ttl ..\ata-chapters.n3 ..\ata-groups.n3 > ..\ata-100.ttl
@echo on