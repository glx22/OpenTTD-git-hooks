FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY files/run.sh /usr/bin/
COPY files/is-on-top-of-master.sh /usr/bin/
COPY hooks/* /git-hooks/

ENTRYPOINT ["run.sh"]
CMD []
