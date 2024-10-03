# Second Meeting Notes

Date: 10/05/2024

Participants:Giacomo Agostini(GA),Stefano Trucco(ST), Farshad MoradiSharbabak(FM), Alireza Ghorbani(AG)

## Notes
At the start of the meeting, we showcased the initial implementation of our project, which involved developing a simple microservice program using Spring Boot. We walked through the microservice's functionality and architecture, highlighting key components and design decisions.

Following this, we demonstrated our CI/CD pipeline setup. We showed how pushing the code to GitHub automatically triggers the pipeline configured via a GitHub Actions workflow file (build.yml). This file initiates the build process, ensuring that every code change is tested and built seamlessly. 

ST:We currently do not use GitHub in our development process, and that is a problem.

As a result, we cannot utilize GitHub Actions for our CI/CD pipeline. Therefore, we must switch to Jenkins to create the pipeline and trigger the build, test, and deploy processes






### Is using SpringBootTest sufficient for Stage 2, or do you need to incorporate other types of tests??(AG)

(GA): In our development process, it is crucial to maintain a separate repository specifically for push test scripts. This segregation is particularly important when dealing with scripts, such as Python files, that are designed to trigger pipelines upon being pushed.

### Do you use Gradle or Maven in your project??(AG)

(GA): We use Gradle in our project, but if you use Maven, that's totally fine.


