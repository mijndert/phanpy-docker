FROM alpine:3 as dl
ARG VERSION
ENV VERSION=${VERSION}
RUN apk add --update curl
RUN curl -sLO "https://github.com/cheeaun/phanpy/releases/download/${VERSION}/phanpy-dist.tar.gz" 
RUN mkdir /phanpy 
RUN tar zxf phanpy-dist.tar.gz -C /phanpy

FROM nginx:1-alpine
LABEL maintainer="Mijndert Stuij <mijndert@mijndertstuij.nl>"
LABEL org.opencontainers.image.source=https://github.com/mijndert/phanpy-docker
LABEL org.opencontainers.image.description="Docker image for running phanpy"
LABEL org.opencontainers.image.licenses=MIT
COPY --from=dl /phanpy /usr/share/nginx/html