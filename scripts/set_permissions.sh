#!/bin/bash
touch /home/ec2-user/flaskapp/app.log
chmod 666 /home/ec2-user/flaskapp/app.log
echo "Permissions set for app.log" # >> /home/ec2-user/flaskapp/app.log