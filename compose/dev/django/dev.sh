#!/bin/bash

python3 manage.py migrate
# echo "hello"
uvicorn config.asgi:application --host 0.0.0.0
echo "Django server is up!"