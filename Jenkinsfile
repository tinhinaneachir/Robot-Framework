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
    }
}
