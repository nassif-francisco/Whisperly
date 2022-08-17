FROM python:3.8

COPY . /app
COPY requirements.txt /app/requirements.txt
WORKDIR /app

RUN pip install -r requirements.txt
RUN chmod u+x /app/entrypoint.sh

#CMD ["python", "print("bla")"]
#ENTRYPOINT /app/entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "gunicorn -k geventwebsocket.gunicorn.workers.GeventWebSocketWorker -w 1 -b 0.0.0.0:5000 application:app"]

