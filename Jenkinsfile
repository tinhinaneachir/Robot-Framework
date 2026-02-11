pipeline {
    agent any

        environment {
        XRAY_TOKEN = credentials('XRAY_TOKEN') //token de jenkins
    }

    stages {
        stage('Installation des dépendances') {
            steps {
                bat 'pip3 install -r requirements.txt'
            }
        }

        stage('Exécution des tests') {
            steps {
                bat 'robot --output results.xml tests'
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
}
