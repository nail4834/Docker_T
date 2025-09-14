pipeline {
    agent any

    environment {
        IMAGE_NAME = "docker_t_app"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'CI-CD', url: 'https://github.com/nail4834/Docker_T.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }

        stage('Install Requirements') {
            steps {
                script {
                    sh """
                        python3 -m venv venv
                        . venv/bin/activate
                        pip install -r requirements.txt
                    """
                }
            }
        }

        stage('Run Application Test') {
            steps {
                script {
                    // Run container to verify it starts (detach mode for testing)
                    sh """
                        docker run --name test_container -d ${IMAGE_NAME}:${IMAGE_TAG}
                        sleep 5
                        docker logs test_container
                        docker stop test_container
                        docker rm test_container
                    """
                }
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'requirements.txt', fingerprint: true
            }
        }
    }

    post {
        always {
            sh "docker system prune -f || true"
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Please check logs.'
        }
    }
}

