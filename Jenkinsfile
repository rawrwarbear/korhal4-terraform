pipeline {
    agent { label 'terraform' }
    stages {
        stage('Echo'){
            steps{
                sh 'terraform --version'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'I succeeded!'
        }
        unstable {
            echo 'I am unstable :/'
        }
        failure {
            echo 'I failed :('
        }
        changed {
            echo 'Things were different before...'
        }
    }
}