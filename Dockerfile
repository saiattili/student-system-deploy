FROM tomcat:9.0-jre11-slim

# 1. Clean out the default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Copy your WAR file to the webapps folder as ROOT.war
# This ensures it loads at the base URL (/)
COPY StudentApp.war /usr/local/tomcat/webapps/ROOT.war

# 3. Create a folder for the app to unpack into
RUN mkdir -p /usr/local/tomcat/webapps/ROOT && \
    unzip /usr/local/tomcat/webapps/ROOT.war -d /usr/local/tomcat/webapps/ROOT

EXPOSE 8080
CMD ["catalina.sh", "run"]
