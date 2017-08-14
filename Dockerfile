FROM bradyt/docker-hledger-bin

COPY data /data
VOLUME /data

EXPOSE 5000
