#!/usr/bin/env bash
##########################################################################
RED='\033[0;31m' # Red
NC='\033[0m' # No Color CAP
##########################################################################
#
if [[ ! -z ${1} ]] && [[ ! -z ${2} ]] && [[ ! -z ${3} ]]; then
yum install yum -y  nfs-utils nfs-utils-lib firewalld
wait $!
printf "\n\n"
mkdir -p ${3}   # /mnt/nfsfileshare
mount ${1}:${2} ${3}
wait $!
printf "\n\n"
mount | grep nfs
wait $!
printf "\n\n"
if [[ $(cat /etc/fstab | grep ${1} | grep ${2} | grep -c ${3}) -eq 0 ]]; then
cat >>/etc/fstab<<EOF
${1}:${2} ${3}  nfs     nosuid,rw,sync,hard,intr    0   0
EOF
printf "\n\nMounted ${2} successfully to ${3} from host ${1}...\n\n\n"
ls lia ${3}
printf "\n\n"
fi
#
else
#
printf "\nUsage: ${RED}${0} <Ip address> <remote source directory> <host destination directory> ${NC}\n"
printf "\nExample: ${RED}mount 10.0.0.10:/nfsfileshare /mnt/nfsfileshare${NC}\n"
exit 1
#
fi
exit 0