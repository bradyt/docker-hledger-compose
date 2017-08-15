
# About

This repo uses a docker file and docker compose file to get a
fresh-ish build of hledger-web up and running quickly.

The image that it pulls is thin for your convenience. The image was
built with two Dockerfiles, one that takes about two hours to build on
Docker Hub, and a second that pulls that fat image and uses Docker's
new-ish multistage feature to build a thin image with all the hledger
executables.

# Quickstart

```
git clone https://github.com/bradyt/docker-hledger-compose.git
cd docker-hledger-compose
mkdir ~/hledger-data
touch ~/hledger-data/hledger.journal
docker-compose up
```

Now navigate to <http://localhost:5000>

# Customization

If you'd like to store the persistent data somewhere else, modify
volumes in `docker-compose.yml`, where you see the following.

    volumes:
      - $HOME/hledger-data:/data

If you'd like to use a reverse proxy with a different url in front,
edit the following in `docker-compose.yml`.

        --base-url=http://127.0.0.1:5000

For example, `--base-url=https://example.com/hledger`.

# What is the chain of base builds?

1. `haskell` <https://hub.docker.com/_/haskell/>
2. `bradyt/docker-compose-build` <https://hub.docker.com/r/bradyt/docker-hledger-build/>
3. `bradyt/docker-compose-bin` <https://hub.docker.com/r/bradyt/docker-hledger-bin>
