pipeline {
    agent any

    environment {
        XRAY_TOKEN = credentials('XRAY_TOKEN')
    }

    stages {

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

        stage('Upload vers Xray') {
            steps {
                bat """
                curl -H "Content-Type: multipart/form-data" ^
                     -H "Authorization: Bearer %XRAY_TOKEN%" ^
                     -F "file=@output.xml" ^
                     https://xray.cloud.getxray.app/api/v2/import/execution/robot
                """
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'output.xml, report.html, log.html', fingerprint: true
        }

        success {
            echo 'Pipeline terminée avec succès !'
        }

        unstable {
            echo 'Certains tests ont échoué, mais les résultats ont été envoyés à Xray.'
        }

        failure {
            echo 'La pipeline a échoué de manière critique.'
        }
    }
}
