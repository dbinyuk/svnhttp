#!/bin/bash

cd /home/dbinyuk/vms/svncookbooktest/
vagrant reload --provision
pushd /tmp
svn co http://127.0.0.1:8080/svn/myproject/
