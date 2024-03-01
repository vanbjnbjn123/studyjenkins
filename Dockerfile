FROM node:21-alpine3.18 as angular
WORKDIR /dist
COPY . .

FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs
COPY --from=angular /dist/webapp .