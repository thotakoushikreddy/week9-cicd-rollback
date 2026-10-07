pipeline {

    agent any

    environment {
        PATH = "/Applications/Docker.app/Contents/Resources/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    }

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
                sh 'docker build -t week9-cicd-app:2.0 .'
            }
        }

        stage('Docker Verify') {
            steps {
                sh 'docker images | grep week9-cicd-app'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x scripts/deploy.sh'
                sh './scripts/deploy.sh'
            }
        }

        stage('Verify') {
            steps {
                sh 'curl -f http://localhost:8081'
            }
        }

        stage('Rollback') {
            steps {
                echo 'Rollback stage'
            }
        }
    }
}
