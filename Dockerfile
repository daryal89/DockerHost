#FROM centos:latest
FROM centos:7
MAINTAINER dhrubaaryal10@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/bigwing.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip bigwing.zip
RUN cp -rvf BigWing/* .
RUN rm -rf BigWing bigwing.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
