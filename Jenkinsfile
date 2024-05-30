pipeline {
    agent any

    tools {
        // Install the Maven version configured in Jenkins
        maven 'Maven 3.6.3'
        // Install the JDK version configured in Jenkins
        jdk 'JDK 17'
    }

    environment {
        // Define environment variables
        MAVEN_CLI_OPTS = '-B -DskipTests'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from version control
                git url: 'https://github.com/farshadmrd/jenkins_test.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // Run Maven build
                sh 'mvn clean package $MAVEN_CLI_OPTS'
            }
        }

        stage('Test') {
            steps {
                // Run Maven tests
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Run Maven package
                sh 'mvn package'
                echo 'Package created'
            }
        }
        stage('List Directory') {
            steps {
                script {
                    sh 'ls -l'
                }
            }
        }



        //deploy on mini kube
        // stage('Deploy') {
        //     steps {
        //         // Run Maven deploy
        //         sh 'mvn deploy'
        //     }
        // }
    }

    post {
        success {
            // Notify success
            echo 'Build and Deployment Successful'
        }
        failure {
            // Notify failure
            echo 'Build or Deployment Failed'
        }
    }
}
