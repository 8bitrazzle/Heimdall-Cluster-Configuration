#!/bin/bash
##
#Generic first iteration script that bootstraps xcat and builds a stateless cluster
#environment for 10 compute nodes, heimdall-a[00-09], inside IPrange 192.168.1.210-219
#
#Before running script, selinux must be completely disabled (not passive) and a
#FQDN/static address must be assigned. 
##

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "nameserver 8.8.8.8" >> /etc/resolv.conf
/usr/bin/yum update -y
/usr/bin/yum install wget -y
/usr/bin/wget https://raw.githubusercontent.com/xcat2/xcat-core/master/xCAT-server/share/xcat/tools/go-xcat -O - >/tmp/go-xcat
/usr/bin/chmod +x /tmp/go-xcat
echo yes | /tmp/go-xcat install

#if go-xcat executes successfully, setup basic cluster definitions
if [ $? -eq 0 ]; then
	sed -i '/nameserver/d' /etc/resolv.conf
	source /etc/profile.d/xcat.sh
	chtab key=system passwd.username=root passwd.password=test
	mkdef heimdall-a[00-09] groups=compute,all
	chdef -t group compute ip='|heimdall-a(\d+)|192.168.1.21($1+0)|'
	makehosts compute
	makedns -n
	chdef -t node heimdall-a[00-09] mac:'|($1+0)0:10:10:10:10:10|'
	chdef -t node heimdall-a[00-09] netboot=pxe
	makedhcp -n
	makedhcp heimdall-a[00-09]
else
	echo -e "${RED}EXITING: /tmp/go-xcat install failed${NC}"
	exit 1
fi

#wget centos iso, generate, pack, and assign osimage to compute nodes
/usr/bin/wget http://ftp.ussg.iu.edu/linux/centos/7.6.1810/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso -O - >/tmp/centos-compute-img.iso

if [ $? -eq 0 ]; then
	copycds /tmp/centos-compute-img.iso
	lsdef -t osimage -z centos7.6-x86_64-netboot-compute | sed 's/^[^ ]\+:/Centos7.6-Stateless.img:/' | mkdef -z
	genimage Centos7.6-Stateless.img
	packimage Centos7.6-Stateless.img
	nodeset heimdall-a[00-09] osimage=Centos7.6-Stateless.img
else
        echo -e "${RED}EXITING: failed to find /tmp/centos-compute-img.iso${NC}"
        exit 1
fi

	






