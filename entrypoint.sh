#!/usr/bin/env bash

gunicorn -k geventwebsocket.gunicorn.workers.GeventWebSocketWorker -w 1 -b localhost:5000 application:app