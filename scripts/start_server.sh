#!/bin/bash
cd /home/ec2-user/flaskapp
echo "Flask app started" | tee -a app.log
nohup python3 /home/ec2-user/flaskapp/app.py  # >> /home/ec2-user/flaskapp/app.log 2>&1 &
