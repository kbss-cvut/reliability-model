@echo off
set ext=owl
set docdir=docs
set ontos=avic-fmea-data-model



@REM widoco -ontFile .\ufo-a-extension.ttl -outFolder docs\ufo-a-extension -getOntologyMetadata -webVowl

(for %%a in (%ontos%) do ( 
   echo building documentation for ontology "%%a"
   widoco -ontFile .\%%a.%ext% -outFolder %docdir%\%%a -getOntologyMetadata -webVowl -oops -rewriteAll -htaccess -includeAnnotationProperties -displayDirectImportsOnly -rewriteBase ontologies/
))