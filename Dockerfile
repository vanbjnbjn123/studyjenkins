FROM ubuntu:latest
WORKDIR /dist/webapp
RUN ls
COPY . .