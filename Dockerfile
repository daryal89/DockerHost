#FROM centos:latest
FROM centos:7
MAINTAINER dhrubaaryal10@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page278/careo.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip careo.zip
RUN cp -rvf careo/* .
RUN rm -rf careo careo.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
