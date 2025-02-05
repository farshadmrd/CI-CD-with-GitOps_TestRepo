
# User Requirements Specification Document

DIBRIS – Università di Genova. Scuola Politecnica, Software Engineering Course 80154

VERSION: 1.3

## Authors

Alireza Ghorbani, Farshad Moradi

## REVISION HISTORY

| Version | Date       | Authors                     | Notes                                   |
|---------|------------|-----------------------------|-----------------------------------------|
| 1.0     | 2024-04-26 | Alireza Ghorbani | Initial URS draft, pending completion. |
| 1.1     | 2024-04-27 | Farshad Moradi | System Description(Context, Problem), added one Functional Requirement. |
| 1.2     | 2024-05-20 | Alireza Ghorbani | Update Functional & Non-Functional Requirements. |
| 1.3     | 2024-11-03 | Alireza Ghorbani    | Revised Functional & Non-Functional Requirements, clarified pipeline steps, updated System Description, and revised Definitions. |

# Table of Contents

- [User Requirements Specification Document](#user-requirements-specification-document)
	- [Authors](#authors)
	- [REVISION HISTORY](#revision-history)
- [Table of Contents](#table-of-contents)
	- [1. Introduction](#1-introduction)
		- [1.1 Document Scope](#11-document-scope)
		- [1.2 Definitions and Acronym](#12-definitions-and-acronym)
		- [1.3 References](#13-references)
	- [2. System Description](#2-system-description)
		- [2.1 Context](#21-context)
		- [2.2 Motivation(what is the problem?)](#22-motivationwhat-is-the-problem)
		- [2.3 Project Objectives](#23-project-objectives)
	- [3. Requirements](#3-requirements)
		- [3.1 Stakeholders](#31-stakeholders)
		- [3.2 Functional Requirements](#32-functional-requirements)
		- [3.3 Non-Functional Requirements](#33-non-functional-requirements)

## 1. Introduction

### 1.1 Document Scope

The proposed project aims to define and implement an automatic pipeline consisting of three stages, based on the GitOps framework. This pipeline is intended to streamline development and operations processes within the company. The primary audience for this document includes company staff, employers, and regular users who may not possess deep technical knowledge but need to understand the system's purpose and functionality.

### 1.2 Definitions and Acronym

| Acronym         | Definition |
|-----------------|------------|
| Jenkins         | An open-source automation server used to streamline and automate parts of the software development process. |
| Jenkinsfile     | A text file that contains the definition of a Jenkins Pipeline, specifying steps, stages, and conditions for the automation process. |
| Pipeline        | A set of automated processes and tools that allow code to be built, tested, and deployed into production. |
| CI/CD           | A software development practice that automates the integration and delivery/deployment of code to streamline and expedite updates. |
| Smoke Tests     | Preliminary tests to detect simple failures, crucial in complex systems to ensure basic functionality before detailed testing. |
| GitOps          | A set of practices to manage infrastructure and application configurations using Git. |
| IaC             | Infrastructure as Code: A process that manages and provisions computing infrastructure through machine-readable definition files. |
| Minikube        | A tool that enables running Kubernetes locally, useful for testing and development. |
| GitHub Actions  | GitHub's automation and CI/CD platform, enabling automated workflows and actions within repositories. |
| Spring Boot     | A framework for building Java-based applications enabling quick development of microservices. |

### 1.3 References

- [CI/CD](https://en.wikipedia.org/wiki/CI/CD)
- [IaC](https://en.wikipedia.org/wiki/Infrastructure_as_code)
- [Spring Framework](https://spring.io/)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [Jenkins](https://www.jenkins.io/)
- [GitHub Actions](https://docs.github.com/en/actions)

## 2. System Description

A CI/CD system is an essential part of modern software development practices, aimed at automating and streamlining the process from code integration to delivery and deployment. In this project, Jenkins is used to automate the CI/CD pipeline, while Minikube is utilized for local deployment and testing, simulating a real-world deployment environment.

### 2.1 Context

This project addresses the need for a robust, scalable, and efficient development workflow within the company. By automating the development pipeline with Jenkins, the system aims to reduce manual errors, improve deployment times, and ensure a higher quality of software releases.

1. Once CI has successfully built and tested the code, the CD process starts.
2. Code is pulled into the deployment pipeline.
3. Further tests, such as integration and acceptance tests, are conducted.
4. The code is deployed to various environments (e.g., staging, production) using automation tools.
5. Monitoring and rollback mechanisms are in place to handle any issues that arise post-deployment.

### 2.2 Motivation(what is the problem?)

 One of the biggest challenges in software development is the time it takes to move from writing code to deploying it into production. Manual processes are prone to human error; bugs and issues may slip through to production without consistent and automated testing. Additionally, deploying large batches of changes at once can be risky and may lead to significant downtime if something goes wrong.
 CI/CD supports scalability and makes it easier to manage large-scale operations, as well as facilitating more flexible responses to change.

### 2.3 Project Objectives

The system's goals include:

- Building a simple microservices application using the Spring Boot framework.
- Executing smoke tests to verify the basic functionality of the application.
- Releasing the application directly onto a server at a simulated customer premises to demonstrate real-world deployment.

## 3. Requirements

| Priority | Meaning |
| --------------- | ----------- |
| M | **Mandatory:**   |
| D | **Desiderable:** |
| O | **Optional:**    |
| E | **Future Enhancement:** |

### 3.1 Stakeholders

- **Alireza Ghorbani and Farshad Moradi:** Students who are undertaking this project as part of their internship.
- **Ericsson:** The company providing the internship, is interested in the successful deployment of the project.
- **Unige:** Acts as a mediator between the students and the company, facilitating the internship arrangement.

### 3.2 Functional Requirements

| ID  | Description                                                              | Priority |
|-----|--------------------------------------------------------------------------|----------|
| 1.0 | The pipeline should take as input a REST API microservice built using the Spring Boot framework.              | M |
| 1.1 | The REST API microservice should return `Hello World!` when a GET request is made to the `/hello` endpoint.  | M |
| 1.2 | The REST API microservice should follow Spring Boot patterns for Service Registry. | M |
| 1.3 | The REST API microservice should follow Spring Boot patterns for Config Server. | M |
| 1.4 | The REST API microservice should follow Spring Boot patterns for API Gateway. | M |
| 2.0 | The pipeline should deploy the microservices on Minikube | M |
| 3.0 | The pipeline should take as input the smoke test scripts. | M |
| 3.1 | The pipeline should run the smoke tests on the deployed microservices. | M |
| 4.0 | The pipeline should be automatically triggered when a new commit is pushed to the main or test repository. | M |

### 3.3 Non-Functional Requirements

| ID  | Description                                                              | Priority |
|-----|--------------------------------------------------------------------------|----------|
| 1.0 | The pipeline should complete the entire process, from code integration to deployment and testing, in under 10 minutes. | D |
