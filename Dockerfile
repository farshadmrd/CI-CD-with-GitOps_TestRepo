# Use the official Jenkins image as the base image
FROM jenkins/jenkins:lts

# Switch to the root user to install packages
USER root

# Update the package list and install Python
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python

# Switch back to the Jenkins user
USER jenkins
