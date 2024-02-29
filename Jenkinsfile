pipeline {
    agent any

    tool 'node LTS'

    environment {
        CHROME_BIN = "/Applications/Google Chrome"
    }

    stages {
        stage('Wellcome') {
            steps {
                echo 'Wellcom to CI'
            }
        }
        stage('NPM install') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'ng test --progress=false --watch false'
            }
        }
        stage('Build') {
            steps {
                sh "ng build"
            }
        }
        stage('Packaging/Pushing imagae') {

            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t trinm09/angular .'
                    sh 'docker push trinm09/angular'
                }
            }
        }
        stage('Deploy angular to DEV') {
            steps {
                echo 'Deploying and cleaning'
                sh 'docker image pull trinm09/angular'
                sh 'docker container stop trinm-angular || echo "this container does not exist" '
                sh 'docker network create dev || echo "this network exists"'
                sh 'echo y | docker container prune '

                sh 'docker container run -d --rm --name trinm-angular -p 8081:8080 --network dev trinm09/angular'
            }
        }
    }
    post {
        // Clean after build
        always {
            cleanWs()
        }
    }
}