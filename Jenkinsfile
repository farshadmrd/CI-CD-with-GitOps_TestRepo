pipeline {
    agent any
    environment {
        DOCKER_HOST = 'tcp://127.0.0.1:2375'
        DOCKER_TLS_VERIFY = '1'
        DOCKER_CERT_PATH = '/path/to/certs'
    }
    stages {
        stage('Set Docker Context') {
            steps {
                script {
                    sh 'docker context use default'
                }
            }
        }
        stage('Start Minikube') {
            steps {
                script {
                    if (OS_TYPE == 'UNIX') {
                        sh '''
                        echo "Starting Minikube on Unix..."
                        minikube start --driver=docker
                        '''
                    } else {
                        bat '''
                        echo "Starting Minikube on Windows or non-Unix..."
                        minikube start --driver=docker
                        '''
                    }
                }
            }
        }
    }
}
