pipeline {
  agent {
    docker {
      image 'python:3.11-slim'
      args '-u 0'
    }
  }

  stages {
    stage('Install deps') {
      steps {
        sh '''
          python -m pip install --upgrade pip
          if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
          pip install pytest pytest-cov
        '''
      }
    }
    stage('Run unit tests') {
      steps {
        sh '''
          mkdir -p reports/coverage_html
          pytest -q --junitxml=reports/junit.xml
        '''
      }
    }
  }

  post {
    always {
      junit allowEmptyResults: true, testResults: 'reports/junit.xml'
      archiveArtifacts artifacts: 'reports/**/*', fingerprint: true, onlyIfSuccessful: false
    }
  }
}

