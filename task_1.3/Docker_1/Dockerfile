FROM postgres:latest
ENV POSTGRES_PASSWORD=1234
ENV POSTGRES_USER=de_study
ENV POSTGRES_DB=database
COPY init_scripts/init.sql /docker-entrypoint-initdb.d/init.sql
#RUN init_scripts/jun_scripts.sql /docker-entrypoint-initdb.d/init.sql