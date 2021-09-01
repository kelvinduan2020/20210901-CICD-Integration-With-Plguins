FROM tomcat:8.0.20-jre8
# Dummy text to test 
COPY target/myapp-*.war /usr/local/tomcat/webapps/myapp.war
# More detailed docker instructions could be possible in prod
