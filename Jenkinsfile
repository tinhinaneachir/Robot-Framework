pipeline {
    agent any

    stages {

        stage('Installation des dependances') {
            steps {
                bat 'pip3 install -r requirements.txt'
            }
        }

        stage('Execution des tests') {
            steps {
                bat 'robot tests'
            }
        }

        stage('Publication des resultats') {
            steps {
                archiveArtifacts artifacts: '**/*.xml, **/*.html', fingerprint: true
            }
        }
    }
}
