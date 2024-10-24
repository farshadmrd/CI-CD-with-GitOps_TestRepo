pipeline {
    agent any
    environment {
        OS_TYPE = ''
    }

    stages {
        stage('Determine OS') {
            steps {
                script {
                    if (isUnix()) {
                        OS_TYPE = 'UNIX'
                        echo "Operating System: Unix-based"
                    } else {
                        OS_TYPE = 'WINDOWS'
                        echo "Operating System: Windows or non-Unix"
                    }
                }
            }
        }

        stage('Checkout') {
            steps {
                // Checkout code from version control
                git url: 'https://github.com/farshadmrd/CI-CD-with-GitOps_TestRepo', branch: 'main'
            }
        }

        stage('Check Minikube and Restart if Running') {
            steps {
                script {
                    if (OS_TYPE == 'UNIX') {
                        sh '''
                        if minikube status > /dev/null 2>&1; then
                            echo "Minikube is running. Deleting it..."
                            minikube delete
                        fi
                        echo "Starting Minikube on Unix..."
                        minikube start
                        '''
                    } else {
                        bat '''
                        minikube status >nul 2>&1
                        if %ERRORLEVEL% EQU 0 (
                            echo "Minikube is running. Deleting it..."
                            minikube delete
                        )
                        echo "Starting Minikube on Windows or non-Unix..."
                        minikube start
                        '''
                    }
                }
            }
        }
    }
}