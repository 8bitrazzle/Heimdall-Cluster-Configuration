#!/bin/bash
#This script runs once on the machine to bootstrap puppet
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

declare -a roles=(auth, adm)

case $1 in
    auth | adm)
        declare -r role=$1
        ;;
    *)
        /usr/bin/echo -e "${RED}Incorrect role supplied. Valid roles are:${NC} ${roles[@]}"
        exit 1
        ;;
esac

/usr/bin/yum update -y

#installs and runs puppet for the first time
if [ ! -f /etc/yum.repos.d/puppetlabs.repo ]; then
        rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
fi

/usr/bin/yum -y install puppet
/usr/bin/rm -rf /etc/puppet
/usr/bin/ln -s /root/Heimdall-Cluster-Configuration/puppet /etc/puppet
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-common.log /etc/puppet/manifests/common.pp
/usr/bin/puppet apply --logdest /var/log/puppet/puppet-apply-$role.log /etc/puppet/manifests/$role.pp
