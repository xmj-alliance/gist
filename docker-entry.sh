#!/bin/bash
# Execute the up-coming commands on behalf of a specific user
# If userid exists, we will use this existing user and ignores the username/userpasswd
# Otherwise, we will create a new user based on the given userid, username and userpasswd

userpasswd=$EXEC_PASSWD
userid=$EXEC_USER_ID
username=$EXEC_USER_NAME

# Check if userid exists
if id "$userid" >/dev/null 2>&1; then
  username=$(id -nu $userid)
  echo "Waking up $username ..."
else
  echo "Summoning $username - UID:$userid ..."
  # Add user
  useradd -m -s /bin/bash -u $userid $username
  # Change password
  echo "$username:$userpasswd" | chpasswd
fi

exec su-exec $userid "$@"
