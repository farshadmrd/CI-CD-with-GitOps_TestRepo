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
                    } else if (isWindows()) {
                        OS_TYPE = 'WINDOWS'
                        echo "Operating System: Windows"
                    } else {
                        error "OS not recognized. Failing the build."
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

        stage('Start Minikube') {
            steps {
                script {
                    if (OS_TYPE == 'UNIX') {
                        sh '''
                        echo "Starting Minikube on Unix..."
                        minikube start
                        '''
                    } else if (OS_TYPE == 'WINDOWS') {
                        bat '''
                        echo "Starting Minikube on Windows..."
                        minikube start
                        '''
                    }
                }
            }
        }

        // Other stages can also use OS_TYPE as needed without redundant checks
    }
}

def isWindows() {
    return env.NODE_NAME.toLowerCase().contains('windows')
}
