@echo off
set ataroot=..\..\dev-a-input-documents\ontologies\003-ata-aircraft-parts\
set ata100=%ataroot%ata-100.ttl
set output=..\reliability-aviation-profile-components

call jena-cmd.bat
call arq --data=%ata100% --query=ata-100-a-components.sparql > ata-100-components.ttl
call arq --data=%ata100% --query=ata-100-a-has-component.sparql > ata-100-has-component.ttl
call riot --output=TTL --formatted=TTL reliability-aviation-profile-components-header.ttl ata-100-components.ttl ata-100-has-component.ttl > %output%.ttl
call riot --output=RDFXML %output%.ttl > %output%.rdf
@echo on