stage('Unit Tests') {
    steps {
        sh 'pytest --junitxml=results.xml'
    }
    post {
        always {
            junit 'results.xml'
        }
    }
}

