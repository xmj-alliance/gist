#!/bin/bash

folder=$1
owner=$2
group=$3
permission=$4

: ${folder:="."}
: ${owner:="valorad"}
: ${group:="xmj-alliance"}
: ${permission:=755}

xmjOwn() {
  sudo chown $owner:$group -R $folder
  sudo chmod $permission -R $folder
}

xmjOwn
