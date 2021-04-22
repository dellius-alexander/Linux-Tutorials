#!/bin/bash
#	view-private-registry-remote  2.3.2.184  2021-04-10T13:48:30.105938-05:00 (CDT)  https://github.com/BradleyA/Search-docker-registry-v2-script  master  uadmin  six-rpi3b.cptx86.com 2.3.1-2-gb873c33  
#	   view-private-registry view-private-registry-remote -->   new release 2.3.2  
#	view-private-registry-remote  v2.2.42  2019-02-18T23:12:08.838659-06:00 (CST)  https://github.com/BradleyA/Search-docker-registry-v2-script.git  uadmin  two.cptx86.com v2.1  
#	   add License and mark file with markit 
#
### view-private-registry
#       Copyright (c) 2021 Bradley Allen
#       License is in the online DOCUMENTATION, see github
### view-private-registry-remote
#       View private registry v2 from remote host
#
#       Enter remote registtry v2 server IP address or FQDN
REMOTE_REGISTRY_HOST="${__REMOTE_PRIVATE_REGISTRY__}"
#       Enter remote registry v2 ssh admin account for the above host
REMOTE_ADMIN_ACCOUNT="${USER}"
if [ "$1" == "--help" ];
then
        echo -e "\nUsage:  view-private-registry-remote [REMOTE_REGISTRY_HOST] [REMOTE_ADMIN_ACCOUNT]"
        echo -e "\nDisplay remote private registry."
	echo -e "\nDefault:\n\tREMOTE_REGISTRY_HOST=$REMOTE_REGISTRY_HOST"
	echo -e "\tREMOTE_ADMIN_ACCOUNT=$REMOTE_ADMIN_ACCOUNT"
        echo -e "\nOptions:\n\t--help	Print usage\n"
	exit
fi
if [ ! -z $1 ];
then
#       Set remote registtry v2 server IP address or FQDN
	REMOTE_REGISTRY_HOST="$1"
        echo "REMOTE_REGISTRY_HOST=$1"
fi
if [ ! -z $2 ];
then
#       Set remote registry v2 ssh admin account for the above host
	REMOTE_ADMIN_ACCOUNT="$2"
        echo "REMOTE_ADMIN_ACCOUNT=$2"
fi
##
ssh $REMOTE_ADMIN_ACCOUNT@$REMOTE_REGISTRY_HOST /usr/local/bin/view-private-registry