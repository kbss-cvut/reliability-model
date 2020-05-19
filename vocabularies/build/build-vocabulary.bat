REM @echo off
set ritroot=f:\users\kostobog\downloads\rit_-_xsd_schema_4.1.0.7\documented schema\
set annroot=c:\Users\user\Documents\skola\projects\2019-msmt-inter-excelence\code\semantic-reliability\annotations\
set ritata="%ritroot%VL1006_12_11000000_1_4.ttl"
set ritevt="%ritroot%VL1009_5_0_1_5.ttl"
set ritevtman="%ritroot%reference by description-and-manual-extractions.csv"
set ritevtparts="%ritroot%event-reference-to-parts.csv"
set annda42poh=%annroot%BlueSky\DA42-POH-merge.ttl
set ataroot=..\..\dev-a-input-documents\ontologies\003-ata-aircraft-parts\
set ata100=%ataroot%ata-100.ttl
set outdir=..\
set output=..\reliability-aviation-profile-components

call jena-cmd.bat

REM RIT vocabulary
call arq --data=%ritata% --query=rit-ata-components.sparql > rit-ata-components.ttl
echo on
call arq --data=%ritevt% --query=rit-event-types.sparql > rit-event-types.ttl
echo on
call tarql reference-by-description-and-manual-extractions.sparql %ritevtman% > rit-event-types-manual.ttl
echo on
REM Merge RIT profile files into one file
call riot --output=TTL --formatted=TTL rit-profile-header.ttl ^
rit-ata-components.ttl ^
rit-event-types.ttl ^
rit-event-types-manual.ttl > %outdir%reliability-rit-profile.ttl
echo on
call riot --output=RDFXML %outdir%reliability-rit-profile.ttl > %outdir%reliability-rit-profile.rdf
echo on
REM Annotation DA42-POH vocabulary 
call arq --data=%annda42poh% --query=da42-poh-ann.sparql > da42-poh-ann.ttl
call  riot --output=TTL --formatted=TTL annotation-profile-header.ttl ^
da42-poh-ann.ttl > %outdir%reliability-ann-profile.ttl
echo on
call riot --output=RDFXML %outdir%reliability-ann-profile.ttl > %outdir%reliability-ann-profile.rdf

REM call arq --data=%ata100% --query=ata-100-a-components.sparql > ata-100-components.ttl REM moved to ECCAIRS RIT
REM call arq --data=%ata100% --query=ata-100-a-has-component.sparql > ata-100-has-component.ttl


REM call riot --output=TTL --formatted=TTL ^
REM reliability-aviation-profile-components-header.ttl ^
REM rit-ata-components.ttl > %output%.ttl
REM call riot --output=RDFXML %output%.ttl > %output%.rdf

REM @echo on