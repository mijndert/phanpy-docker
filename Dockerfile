FROM nginx:1-alpine
LABEL maintainer="Mijndert Stuij <mijndert@mijndertstuij.nl>"
LABEL org.opencontainers.image.source=https://github.com/mijndert/phanpy-docker
LABEL org.opencontainers.image.description="Docker image for running phanpy"
LABEL org.opencontainers.image.licenses=MIT
RUN tar zxf release.tar.gz -C /usr/share/nginx/html