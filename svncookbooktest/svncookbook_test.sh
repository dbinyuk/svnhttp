#!/bin/bash -e

cd /home/dbinyuk/vms/svncookbooktest/
vagrant reload --provision
pushd /tmp

if test -d ./myproject/; then
	rm -rf ./myproject/
	echo "Directory removed: ./myproject/"
fi
mkdir ./myproject/

echo "cloning repo"
svn co --username=admin --password=admin http://127.0.0.1:8082/svn/myproject/ && echo ok


echo Dima is clever > myproject/README.md
cd myproject/
svn status
svn add README.md
#svn --username=admin --password=admin commit -m 'README added'
svn commit -m 'README added'
echo SUCCESS
