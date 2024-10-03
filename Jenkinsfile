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
                git url: 'https://github.com/farshadmrd/CI-CD-with-GitOps_TestRepo', branch: 'main'
            }
        }

      stage('Build Docker Images in Minikube') {
            steps {
                script {
                    // Get Docker environment variables from Minikube
                    def dockerEnvCommand = 'minikube docker-env --shell bash'
                    def dockerEnv = sh(script: dockerEnvCommand, returnStdout: true).trim()
                    def envVars = []
                    dockerEnv.eachLine { line ->
                        if (line.startsWith('export')) {
                            def keyValue = line.replace('export ', '').split('=')
                            def key = keyValue[0]
                            def value = keyValue[1].replaceAll('"', '')
                            envVars.add("${key}=${value}")
                        }
                    }
                    // Use Minikube's Docker daemon to build images
                    withEnv(envVars) {
                        sh 'docker-compose build'
                    }
                }
            }

        // stage('Checkout to test files') {
        //     steps {
        //         // Checkout code from version control
        //         git url: 'https://github.com/farshadmrd/testFiles_Jenkins.git', branch: 'main'
        //     }
        // }
        

        // stage('Run Python Script') {

        //     steps {
        //         // Ensure Python is available in the environment
        //         sh 'python --version'
                
        //         // Run the Python script. Replace 'simpleTest.py' with the actual file name
        //         sh 'python simpleTest.py'
        //     }
        // }
        // stage('Package') {
        //     steps {
        //         dir('microservices/hello-world') {

        //             // Run Maven package
        //             sh 'mvn package'
        //             echo 'Package created'
        //             sh 'ls -l'
        //             sh 'pwd'
        //         }

        //     }
        // }
       


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
            echo 'Build and Test Successful'
        }
        failure {
            // Notify failure
            echo 'Build or Test Failed'
        }
    }
}
