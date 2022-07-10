FROM proxy-docker.sourdin.ovh/python:3.10.5-alpine3.15
RUN /usr/sbin/adduser -g python -D python && apk update && apk upgrade
USER python
COPY --chown=python:python requirements.txt /home/python/docker-pelican/requirements.txt
RUN pip install --no-cache-dir --requirement /home/python/docker-pelican/requirements.txt
WORKDIR /pelican-site
