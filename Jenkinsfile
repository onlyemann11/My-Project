pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                sh '''
                    python3 -m pip install --upgrade pip
                    pip install pytest pytest-cov
                '''
            }
        }

        stage('Run unit tests') {
            steps {
                sh '''
                    mkdir -p reports
                    pytest --junitxml=reports/results.xml --cov=. --cov-report=xml:reports/coverage.xml
                '''
            }
        }
    }

    post {
        always {
            // Publish the test results to Jenkins
            junit 'reports/results.xml'
            // Save coverage file so you can download/view it later
            archiveArtifacts artifacts: 'reports/**', fingerprint: true
        }
    }
}

