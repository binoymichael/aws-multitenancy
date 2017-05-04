#!/bin/sh
# Script will generate uml class diagrams
BASEDIR=$(dirname "$0")
INPUT_FOLDER=$1
OUTPUT_FOLDER=${2//\//}

java -jar "$BASEDIR/202project.jar" as $INPUT_FOLDER $OUTPUT_FOLDER
java -jar "$BASEDIR/umlgraph-5.7.2.23.jar" -attributes -operations -types -visibility  -private   -constructors -output -  "$OUTPUT_FOLDER/IntermediateforUMLGraph.java" | dot -Tpng -o"$OUTPUT_FOLDER.png"
rm -rf $OUTPUT_FOLDER

