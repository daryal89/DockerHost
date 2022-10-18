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





import requests, json

def get_api_auth_heders():
  header={"apikey":"we54554554"}
  return header

def get_list_of_devices():
 try:
  header=get_api_auth_heders()
  api_action_url="https://api.nmly.nml.com/v1/devops/"
  response=request.get(api_action_url,header)
  device_list=json.loads(response.text)
  for device in  device_list:
      device_id=device["device_id"]
      device_rules=get_devices_rules(device_id);
      for device_rule in  device_rules:
         print("Device ID = :"+ device_id)
         print("\n")
         print("List of Device Rules : "+ len(device_rules))
         print("\n")
         print("Device Rule = :"+ device_rule["rule_name"]+"\n")
  else:
    print("All Process done")
 except:
   print("Something went wrong while geting devices")


def get_devices_rules(device_id):
 try:
  header=get_api_auth_heders()
  api_action_url="https://api.nmly.nml.com/v1/devops/"+device_id
  response=request.get(api_action_url,header)
  device_rule_list=json.loads(response.text)
  return device_rule_list;
 except:
   print("Something went wrong while geting device rule")

