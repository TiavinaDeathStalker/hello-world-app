pipeline {
    agent any
    tools { maven 'Maven 3' }
    stages {
        stage('git checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/TiavinaDeathStalker/hello-world-app.git'
            }
        }
        stage('Compile') {
            steps { bat 'mvn clean comple' }
        }
        stage('Unit Test Execution') {
            steps { bat 'mvn test' }
        }
        stage('Package') {
            steps { bat 'mvn package -DskipTests' }
        }
        stage('Build the docker image') {
            steps { bat 'wsl docker build --tag tiavinarat/hello-world-app:1.0.0 .' }
        }
        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DH_USER', passwordVariable: 'DH_PASS')]) {
                    bat 'echo %DH_PASS%| wsl docker login -u %DH_USER% --password-stdin'
                    bat 'wsl docker push tiavinarat/hello-world-app:1.0.0'
                }
            }
        }
    }
    post {
        failure {
            emailext body: 'Ce Build $BUILD_NUMBER a échoué',
                     subject: 'Build échoué',
                     to: 'tiavinaratovonanahary@gmail.com'
        }
    }
}