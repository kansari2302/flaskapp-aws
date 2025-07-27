#!/bin/bash
cd /home/ec2-user/flaskapp
touch app.log
chmod 666 app.log
echo "Flask app started" | tee -a app.log
nohup python3 app.py >> app.log 2>&1 &
