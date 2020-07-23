#! /bin/bash

#updating centos with any patches
yum update -y --exclude=kernel

# installing tools
yum install -y nano git unzip screen nc telnet
