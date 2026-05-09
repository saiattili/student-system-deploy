FROM tomcat:9.0-jre11-slim

# 1. Force-remove all default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Find any .war file in the main folder and rename it to ROOT.war
# This bypasses any naming or path issues
COPY *.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
