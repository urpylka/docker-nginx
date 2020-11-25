FROM nginx:1.17.8-alpine

LABEL maintainer="urpylka@gmail.com"

# webproc release settings
ENV WEBPROC_VERSION 0.2.2
ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/$WEBPROC_VERSION/webproc_linux_amd64.gz

# install webproc
RUN apk update \
	&& apk add --no-cache --virtual .build-deps curl \
	&& curl -sL $WEBPROC_URL | gzip -d - > /usr/local/bin/webproc \
	&& chmod +x /usr/local/bin/webproc \
	&& apk del .build-deps

# configure nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 8080

ENTRYPOINT ["webproc", "--config", "/etc/nginx/conf.d/default.conf", "--", "/usr/sbin/nginx", "-g", "daemon off;"]
