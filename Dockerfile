FROM alpine:3 as dl
RUN apk add curl
RUN curl -L -o release.tar.gz $(curl -s https://api.github.com/repos/cheeaun/phanpy/releases/latest | grep "browser_download_url" | grep ".tar.gz" | cut -d '"' -f 4)
RUN mkdir /phanpy 
RUN tar zxf release.tar.gz -C /phanpy

FROM nginx:1-alpine
LABEL maintainer="Mijndert Stuij <mijndert@mijndertstuij.nl>"
LABEL org.opencontainers.image.source=https://github.com/mijndert/phanpy-docker
LABEL org.opencontainers.image.description="Docker image for running phanpy"
LABEL org.opencontainers.image.licenses=MIT
COPY --from=dl /phanpy /usr/share/nginx/html