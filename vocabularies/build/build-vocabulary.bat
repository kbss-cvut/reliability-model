@echo off
set ritroot=f:\users\kostobog\downloads\rit_-_xsd_schema_4.1.0.7\
set ritata=VL1006_12_11000000_1_4.ttl
set ataroot=..\..\dev-a-input-documents\ontologies\003-ata-aircraft-parts\
set ata100=%ataroot%ata-100.ttl
set output=..\reliability-aviation-profile-components

call jena-cmd.bat

call arq --data=%ritata% --query=rit-ata-components.sparql > rit-ata-components.ttl
REM call arq --data=%ata100% --query=ata-100-a-components.sparql > ata-100-components.ttl REM moved to ECCAIRS RIT
REM call arq --data=%ata100% --query=ata-100-a-has-component.sparql > ata-100-has-component.ttl

call riot --output=TTL --formatted=TTL ^
reliability-aviation-profile-components-header.ttl ^
rit-ata-components.ttl > %output%.ttl

call riot --output=RDFXML %output%.ttl > %output%.rdf

@echo on