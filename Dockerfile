FROM proxy-docker.sourdin.ovh/alpine:3
RUN apk update && apk upgrade && apk add --no-cache git py3-pip make && pip3 install pelican[markdown] pelican-sitemap weasyprint "https://github.com/nairobilug/pelican-alchemy/tarball/master"
