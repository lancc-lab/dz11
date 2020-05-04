FROM tomcat
RUN apt-get -y update
RUN apt-get -y install maven && apt-get -y install git && apt-get -y install docker.io
ADD /target/hello-1.0.war /usr/local/tomcat/webapps/
