FROM tomcat:9.0-jre11-slim

# 1. Remove EVERYTHING from the webapps and webapps.dist folders
# Tomcat sometimes keeps a backup in webapps.dist that restores itself
RUN rm -rf /usr/local/tomcat/webapps/* && rm -rf /usr/local/tomcat/webapps.dist/*

# 2. Copy your WAR file specifically as ROOT.war
COPY StudentApp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
