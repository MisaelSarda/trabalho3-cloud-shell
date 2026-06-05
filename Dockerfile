FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY . /app

CMD ["tail", "-f", "/dev/null"]