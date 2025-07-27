#!/bin/bash

echo "Installing Python3 and pip3 if missing..."
sudo yum install -y python3-pip

echo "Installing Flask..."
pip3 install --user -r /home/ec2-user/flaskapp/requirements.txt

echo "Dependencies installed successfully"
echo "You can now start the Flask app using the start_server.sh script"
echo "To stop the Flask app, use the stop_server.sh script"
echo "Make sure to run these scripts with appropriate permissions"
echo "For example, use 'sudo ./start_server.sh' or 'sudo ./stop_server.sh' if necessary"
echo "Installation complete"