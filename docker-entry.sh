#!/bin/sh
# This file is used to change permission for a normal user on docker container run.

username=$EXEC_USER
userid=${EXEC_USER_ID}

echo "Summoning $username - UID:$userid ..."

# Add local user
adduser $username -u $userid -D -s /bin/sh
chown -R $username /www
chmod -R 755 /www
exec su-exec $username "$@"
