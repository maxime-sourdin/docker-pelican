FROM proxy-docker.sourdin.ovh/python:3.10.5-alpine3.15
RUN /usr/sbin/adduser -g python -D python && apk update && apk upgrade && apk add py3-pip py3-pillow py3-cffi py3-brotli gcc musl-dev python3-dev pango
USER python
RUN /usr/local/bin/python -m venv /home/python/venv
ENV PATH="/home/python/venv/bin:${PATH}" \
    PYTHONUNBUFFERED="1"
COPY --chown=python:python requirements.txt /home/python/docker-pelican/requirements.txt
RUN /home/python/venv/bin/pip install --no-cache-dir --requirement /home/python/docker-pelican/requirements.txt
WORKDIR /pelican-site
#ENTRYPOINT ["/home/python/venv/bin/pelican"]
