# CI/CD with GitOps

<img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white" /> <img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" /> <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white" /> <img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white" />


The project proposed consists of defining and implementing an automatic pipeline with 3 stages based on the GitOps framework used to:
- build a simple micro-services application using the [Spring Boot](https://spring.io/) framework
- execute smoke tests on the application
- release application directly on a server in a simulated customer premises

This project uses tools such as [Minikube](https://minikube.sigs.k8s.io/docs/), and [Jenkins](https://www.jenkins.io/) to build the pipeline.

## Description:
When a developer pushes a Java file or a test script to another repository on GitHub, the pipeline is triggered from the beginning. The pipeline consists of three main stages: Build, Test, and Deploy.

Build Stage: The process begins with setting up a Minikube environment on the local machine and running it.
Next, within run a batch file use the configuration files generated by the Kompose tool from the docker-compose setup to configure and deploy the application in the Kubernetes environment.

Test Stage: Verify that all services are deployed and configured correctly in the environment. Ensure that all services are running as expected. If any issues are detected, identify and report the specific service causing the problem.

Deploy Stage: If all tests pass successfully in the test environment (Kubernetes environment), deploy the application to the production environment using the Greenfield approach. This ensures the application is installed on a clean setup without any previous versions running.

## Ericsson

Ericsson is a global leader in communications technology, focusing on innovation and collaboration to shape the future of connectivity. They are at the forefront of 5G technology, offering unprecedented speed, flexibility, and reliability. Their solutions span from edge computing to IoT, aiming to simplify global connectivity and enable businesses to scale their operations efficiently.

This project is the result of an internship during our master's degree and all of its rights belong to the company. 

For more details, visit their website [here](https://www.ericsson.com/).
