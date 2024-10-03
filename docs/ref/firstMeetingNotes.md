# First Meeting Notes

Date: 12/04/2024

Participants:Giacomo Agostini(GA),Stefano Trucco(ST), Farshad MoradiSharbabak(FM), Alireza Ghorbani(AG)

## Notes

### Could you please explain more about this project and provide a thorough detail of these three stages: build, smoke test, and deployment??(FM)

(GA): The implement of project has 3 steps:
step one- Build up and deploy spring boot microsystems application based on Spring Boot(Ubuntu Virtual Machine, JDK version 17, Spring Boot)
Implement following Spring boot patterns Service Registry, Config Server, API-Gateway
Implement simple application, i.e. webserver to show “Hello World”
This application to be released on Git Server

step two- Configure 3 stage pipeline (Build, SmokeTest, Deploy in production Environment)
Another Git project to store pipeline
The pipeline can be written  Python, Jenkins, Eiffel
Pipeline Configuration file to be written, archived to GIT
Pipeline must be triggered to run at every file modified in Pipeline project and Application as well
Implement tests to be launched during 2nd step of pipeline execution (SmokeTest)
Tests to be delivered in Git

step three- Prepare a VM with Minikube:
Green field, the application will have to be installed without a previous version application running
Brown field, new version of application must be installed, upgrading the previous one running.

### What are the specific objectives you aim to achieve with the new setup?(FM)

(GA) Any developer pushes the commits to the Git server first. Then, the application is built, and smoke tests are executed on it. Afterward, it will be deployed on the server. We want the whole process to stop if any of these stages fail.

### Is there already a prewritten java microservice that we need to handle for CI/CD, or we have to build one from scratch??(AG)

(GA):No preliminary work has occurred, and you must provide all three stages from scratch.

### What is the expected timeline for setting up this environment?(AG)

(ST): Since this project is entirely separate from other projects and there are no dependencies between them from our end, we don't have any deadlines. It's up to your professor.

### Is there any regular schedule for our meetings(AG)

(ST): We can approach it in two ways: either every two weeks or whenever there is progress or you have a question. In the latter case, please contact us via email, and we can schedule a meeting.
