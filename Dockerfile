# Use the official Tomcat image with Java 11 (or change to your Java version)
FROM tomcat:9.0-jre11-slim

# Remove the default Tomcat startup page
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into the Tomcat server and rename it to ROOT.war 
# (This ensures your app loads directly on the main URL without needing /StudentApp at the end)
COPY StudentApp.war /usr/local/tomcat/webapps/ROOT.war

# Tell Railway that Tomcat runs on port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]