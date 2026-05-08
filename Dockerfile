# Use the official Tomcat image
FROM tomcat:9.0-jre11-slim

# Delete Tomcat's default welcome page
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your exact file and rename it to ROOT.war
COPY StudentApp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
