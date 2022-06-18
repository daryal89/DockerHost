#FROM centos:latest
FROM centos:7
MAINTAINER dhrubaaryal10@gmail.com
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://www.free-css.com/assets/files/free-css-templates/download/page279/ecourses.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip ecourses.zip
RUN cp -rvf online-courses-html-template/* .
RUN rm -rf online-courses-html-template ecourses.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
