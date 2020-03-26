pipeline {
  agent any
    environment {
      imageName = "altertech/postfix-relay"
    }
  stages {
    stage('image') {
      steps {
        script {
          sh "docker build -t ${imageName}:${BUILD_NUMBER} ."
        }}
    }
    stage('pub') {
      steps {
        script {
          sh "docker tag ${imageName}:${BUILD_NUMBER} ${imageName}:latest"
          sh "docker push ${imageName}:${BUILD_NUMBER}"
          sh "docker push ${imageName}:latest"
        }
      }
    }
  }
  post {
    always {
        sh "docker rmi ${imageName}:${BUILD_NUMBER}"
        }
    success { sh 'job-notify ok' }
    failure { sh 'job-notify failed' }
  }
}
