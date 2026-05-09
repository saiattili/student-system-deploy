FROM tomcat:9.0-jre11-slim

# 1. Completely wipe the webapps directory (Removes the Tomcat screen)
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Use a wildcard to find ANY .war file in your repo and force it to be ROOT.war
# This fixes any naming issues (like StudentApp vs studentapp)
COPY *.war /usr/local/tomcat/webapps/ROOT.war

# 3. Ensure the file has correct permissions
RUN chmod 644 /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
