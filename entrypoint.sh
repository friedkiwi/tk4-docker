#!/bin/bash

# determine if first run
if [[ ! -f /dasd/shadow/.initialized ]]
then
	tar xvf /dasd/shadowfiles.tar
	touch /dasd/shadow/.initialized
fi

hercules
