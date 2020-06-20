FROM ubuntu
RUN \
apt-get -y update \
apt-get -y install openjdk-8-jdk wget \
mkdir /usr/local/tomcat \
wget http://www-us.apache.org/dist/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz /tmp/tomcat.tar.gz \
cd /tmp && tar -xvzf tomcat.tzr.gz \
cp -r /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/
ADD ./archive/webapp/target/*.war /usr/local/tomcat/webapp/
EXPOSE 8080
CMD ["catalina.sh","run"]
