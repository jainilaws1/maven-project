FROM ubuntu
RUN apt-get -y update 
RUN apt-get -y install wget 
RUN mkdir /usr/local/tomcat
RUN wget 'https://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.56/src/apache-tomcat-8.5.56-src.tar.gz' '/tmp/tomcat.tar.gz'
RUN cd /tmp && tar -xvzf tomcat.tzr.gz
RUN cp -r /tmp/apache-tomcat-8.5.56-src/* /usr/local/tomcat/
ADD ./archive/webapp/target/*.war /usr/local/tomcat/webapp/
EXPOSE 8080
CMD ["catalina.sh","run"]
