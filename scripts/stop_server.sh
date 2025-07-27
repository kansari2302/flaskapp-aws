#!/bin/bash

pkill -f app.py
echo "Flask app stopped" # >> /tmp/flaskapp.log

APP_PID=$(pgrep -f "python3 app.py")
if [ -n "$APP_PID" ]; then
    echo "Stopping Flask app with PID: $APP_PID"
    kill -9 $APP_PID
    pkill -f app.py || true
    echo "Flask app stopped"
else
    echo "Flask app is not running"
fi
