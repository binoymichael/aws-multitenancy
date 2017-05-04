#!/bin/sh
# Script will generate uml class diagrams

BASEDIR=$(dirname "$0")
java -jar "$BASEDIR/umlparser.jar" $1 $2
