pipeline {
    agent any

    tools {
        // Use the configured Maven and JDK installations
        maven 'Maven 3.6.3'
        jdk 'JDK 17'
    }

    stages {
        stage('Run Python Command') {
            steps {
                script {
                    // Check Python version
                    sh 'python --version'
                    // Run a simple Python command
                    sh 'python -c "print(\'Hello, World!\')"'
                }
            }
        }
    }

    post {
        success {
            // Notify success
            echo 'Python command executed successfully'
        }
        failure {
            // Notify failure
            echo 'Python command execution failed'
        }
    }
}
