FROM tiangolo/uwsgi-nginx-flask:python3.8
RUN pip install --upgrade pip; \
    pip install flask_nav; \
    pip install click; \
    pip install flask_socketio;

COPY ./app /app
WORKDIR /app
ENV FLASK_APP=main.py
ENV FLASK_DEBUG=1
ENV FLASK_RUN_PORT=80
RUN flask init-db
ENTRYPOINT ["python"]
CMD ["main.py"]
