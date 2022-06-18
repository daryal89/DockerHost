#FROM centos:latest
FROM centos:7
MAINTAINER dhrubaaryal10@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/elements.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip elements.zip
RUN cp -rvf elements/* .
RUN rm -rf elements elements.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
