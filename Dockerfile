FROM alpine:3.10.3
LABEL maintainer="sylwek.sokolowski@gmail.com"

ARG BUILD_DATE
ARG BUILD_NAME
ARG BUILD_VERSION
ARG VCS_REF

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name=$BUILD_NAME
LABEL org.label-schema.description="Alpine Linux by Slydeveloper"
LABEL org.label-schema.url="https://github.com/slydeveloper/alpine"
LABEL org.label-schema.vcs-url="https://github.com/slydeveloper/alpine"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Sylwester Sokolowski"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -it --rm slydeveloper/alpine"

RUN apk update && apk add --no-cache \
    curl \
    jq \
    apache2-utils

CMD ["/bin/sh"]