# Use cimg/openjdk:15.0 as the base image
FROM cimg/openjdk:15.0

# Install Tomcat 9.0.95
RUN wget -q https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz && \
    tar xzf apache-tomcat-9.0.95.tar.gz && \
    mv apache-tomcat-9.0.95 /usr/local/tomcat && \
    rm apache-tomcat-9.0.95.tar.gz

# Add your WAR file to the webapps directory
ADD **/*.war /usr/local/tomcat/webapps/

# Expose the port that Tomcat runs on
EXPOSE 8080  # Tomcat default port

# Set the working directory
WORKDIR /usr/local/tomcat/bin

# Start Tomcat
CMD ["catalina.sh", "run"]

