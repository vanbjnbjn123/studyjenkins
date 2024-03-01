
FROM httpd:latest
WORKDIR /usr/local/apache2/htdocs
COPY /dist/webapp .