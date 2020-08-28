FROM cseelye/rpi-nginx-uwsgi-flask:latest
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
#EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["main.py"]