#FROM centos:latest
FROM centos:7
MAINTAINER dhrubaaryal10@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip icream.zip
RUN cp -rvf ice-cream-shop-website-template/* .
RUN rm -rf ice-cream-shop-website-template icream.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
