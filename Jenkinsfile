pipeline {
    agent any

    tools {
        // Install the Python version configured in Jenkins
        'jenkins.plugins.shiningpanda.tools.PythonInstallation' 'Python3'
    }

    stages {
        stage('Run Python Command') {
            steps {
                script {
                    // Check Python version
                    sh 'python3 --version'
                    // Run a simple Python command
                    sh 'python3 -c "print(\'Hello, World!\')"'
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
