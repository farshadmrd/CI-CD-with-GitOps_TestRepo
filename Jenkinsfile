pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo "=== Checking out the Repository ==="
                git url: 'https://github.com/farshadmrd/CI-CD-with-GitOps_TestRepo', branch: 'main'
            }
        }

        stage('Start Minikube') {
            steps {
                script {
                    sh '''
                    echo "=== Starting Minikube ==="
                    minikube stop
                    minikube delete
                    minikube start

                    echo "=== Checking Minikube Status ==="
                    minikube status
                    '''
                }
            }
        }

        stage('Setup Minikube Docker Environment') {
            steps {
                script {
                    echo "=== Setting Up Minikube Docker Environment ==="
                    def rawOutput = sh(script: 'minikube -p minikube docker-env', returnStdout: true).trim()
                    def dockerHost = ''
                    def dockerCertPath = ''

                    rawOutput.split('\n').each { line ->
                        if (line.startsWith("export DOCKER_HOST=")) {
                            dockerHost = line.replace("export DOCKER_HOST=", "").replace('"', '').trim()
                        } else if (line.startsWith("export DOCKER_CERT_PATH=")) {
                            dockerCertPath = line.replace("export DOCKER_CERT_PATH=", "").replace('"', '').trim()
                        }
                    }

                    env.DOCKER_TLS_VERIFY = '1'
                    env.DOCKER_HOST = dockerHost
                    env.DOCKER_CERT_PATH = dockerCertPath
                    env.MINIKUBE_ACTIVE_DOCKERD = 'minikube'
                }
            }
        }

        stage('Rebuild Docker Images') {
            steps {
                script {
                    sh '''
                    echo "=== Rebuilding Docker Images in Minikube Environment ==="
                    docker-compose build --no-cache=false
                    '''
                }
            }
        }

        stage('Deploy Services to Minikube') {
            steps {
                script {
                    sh '''
                    echo "Deploying services using Kubernetes manifests..."
                    ./deploy_services.sh
                    '''
                }
            }
        }
        
        stage('Expose Service via Port-Forward') {
            steps {
                script {
                    echo "=== Exposing API Gateway Service in Minikube ==="
                    sh "nohup kubectl port-forward svc/api-gateway 8080:8080 > port-forward.log 2>&1 &"
                }
            }
        }
        
        stage('Trigger Smoke Test Pipeline') {
            steps {
                script {
                    // Trigger the smoke test pipeline
                    build job: 'API-Gateway-Test'
                }
            }
        }
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
