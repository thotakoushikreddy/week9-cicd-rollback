pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'ls -la'
            }
        }

        stage('Test') {
            steps {
                echo 'Running application tests...'
                sh 'test -f app/index.html'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t week9-cicd-app:1.0 .'
            }
        }

        stage('Docker Verify') {
            steps {
                sh 'docker images | grep week9-cicd-app'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment stage'
            }
        }

        stage('Verify') {
            steps {
                echo 'Application verification stage'
            }
        }

        stage('Rollback') {
            steps {
                echo 'Rollback stage'
            }
        }
    }
}
