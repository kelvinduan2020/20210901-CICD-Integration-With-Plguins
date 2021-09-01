FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/simple-app-*.war /usr/local/tomcat/webapps/simpleapp.war
# More detailed docker instructions could be possible in prod
