pipeline {
    agent any

    // agent {
    //     docker {
    //         image 'python:3.9'
    //     }
    // }    

    tools {
        // Install the Maven version configured in Jenkins
        maven 'Maven 3.6.3'
        // Install the JDK version configured in Jenkins
        jdk 'JDK 17'

        // python 'Python3'
        // dockerTool 'docker-26.1.1'
        'jenkins.plugins.shiningpanda.tools.PythonInstallation' 'Python3'
        // dockerTool "docker-26.1.1"
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
                dir('microservices/hello-world') {
                    // Run Maven build
                    sh 'mvn clean package $MAVEN_CLI_OPTS'
                }
            }
        }

        stage('Test') {
            steps {
                dir('microservices/hello-world') {
                    // Run Maven tests
                    sh 'chmod +x ./mvnw'
                    sh './mvnw test'
                }
            }
        }

       
        stage('Package') {
            steps {
                dir('microservices/hello-world') {

                    // Run Maven package
                    sh 'mvn package'
                    echo 'Package created'
                    sh 'ls -l'
                    sh 'pwd'
                }

            }
        }
       

        // stage('Checkout to test files') {
        //     steps {
        //         // Checkout code from version control
        //         git url: 'https://github.com/farshadmrd/testFiles_Jenkins.git', branch: 'main'
        //     }
        // }
        
        stage('Setup Python') {
         
            steps {
                script{
                    // Update the package list and install prerequisites
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y software-properties-common'
                    
                    // Add the deadsnakes PPA for installing different Python versions
                    sh 'sudo add-apt-repository -y ppa:deadsnakes/ppa'
                    
                    // Update the package list again
                    sh 'sudo apt-get update'
                    
                    // Install Python 3.9
                    sh 'sudo apt-get install -y python3.9'
                    
                    // Optionally, create a symlink to use 'python3.9' as 'python3' or 'python'
                    sh 'sudo ln -s /usr/bin/python3.9 /usr/bin/python3'
                    sh 'sudo ln -s /usr/bin/python3.9 /usr/bin/python'

                    sh 'python --version'

                }

            }
        }

        // stage('Run Python Script') {

        //     steps {
        //         // Ensure Python is available in the environment
        //         sh 'python --version'
                
        //         // Run the Python script. Replace 'simpleTest.py' with the actual file name
        //         sh 'python simpleTest.py'
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
