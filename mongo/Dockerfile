FROM mongo:4.2
COPY ./initdb.d/ /docker-entrypoint-initdb.d/
RUN mkdir -p /home/mongodb
RUN chown mongodb:mongodb /home/mongodb
