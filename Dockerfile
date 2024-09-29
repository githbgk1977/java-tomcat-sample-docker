# Use cimg/openjdk:15.0 as the base image
FROM cimg/openjdk:15.0

# Install wget
#RUN apt-get update && apt-get install -y wget

# Install Tomcat 9.0.95
RUN sudo wget -q https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.95/bin/apache-tomcat-9.0.95.tar.gz && \
    sudo tar xzf apache-tomcat-9.0.95.tar.gz && \
    sudo mv apache-tomcat-9.0.95 /usr/local/tomcat && \
    sudo rm apache-tomcat-9.0.95.tar.gz

# Add your WAR file to the webapps directory
ADD **/*.war /usr/local/tomcat/webapps/

# Expose the port that Tomcat runs on
EXPOSE 8080  # Tomcat default port

# Set the working directory
WORKDIR /usr/local/tomcat/bin

# Start Tomcat
CMD ["catalina.sh", "run"]

