pipeline {
  agent any

  stages {
    stage('checkout') {
      steps {
        checkout scm
      }
    }

    stage('env info') {
      steps {
        sh 'echo Job name: $JOB_NAME'
        sh 'echo "Build number: $BUILD_NUMBER"'
        sh 'uname -a'
        sh 'pwd'
        sh 'ls -la'
      }
    }

    stage('verify build') {
      steps {
        sh 'chmod +x scripts/verify-build.sh'
        sh './scripts/verify-build.sh'
      }
    }

    stage('archive report') {
      steps {
        archiveArtifacts artifacts: 'output/build-report.txt', fingerprint: true
      }
    }
  }

  post {
    success {
      echo 'Pipeline completed successfully!'
    }
    failure {
      echo 'Pipeline failed!'
    }
    always {
      echo 'Build completed.'
    }
  }
}
