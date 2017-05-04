#!/bin/sh
# Script will generate uml class diagrams

BASEDIR=$(dirname "$0")
INPUT_FOLDER=$1
OUTPUT_FILENAME=$2

java -jar "$BASEDIR/umlparser.jar" $INPUT_FOLDER
cat plantuml.txt | java -Djava.awt.headless=true  -jar "$BASEDIR/plantuml.jar" -pipe > $OUTPUT_FILENAME
rm plantuml.txt
