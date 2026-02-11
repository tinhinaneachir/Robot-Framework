pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Installation des dépendances') {
            steps {
                bat 'pip3 install -r requirements.txt'
            }
        }

        stage('Exécution des tests') {
            steps {
                catchError(buildResult: 'UNSTABLE', stageResult: 'UNSTABLE') {
                    bat 'robot --output output.xml tests'
                }
            }
        }
    }
}
