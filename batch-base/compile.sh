#!/usr/bin/env bash

#mvn clean compile assembly:single
#mvn clean package shade:shade

if [ -d distrib ]
then
	echo "remove old distrib"
	rm -Rf ./distrib
fi


mvn clean install && unzip -o target/batch-base-executable.zip && mv batch-base distrib
