#!/bin/bash

nodejs btsync.js init

if [ "$#" -eq 2 ]
then
	nodejs btsync.js add-folder $1 $2
fi

nodejs btsync.js stop
#./console.sh

exec btsync --config /btsync/config --nodaemon
