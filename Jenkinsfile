pipeline {
    agent any

    environment {
        CLIENT_ID = credentials('19B21B3A87A84FB187E8ED0C929260EA')
        CLIENT_SECRET = credentials('8f8d1ba97004498878ddc1f48835d9a997dea57056fe756891ffbd7e1ac68177')
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

        stage('Génération du token Xray') {
            steps {
                bat """
                    curl -H "Content-Type: application/json" -X POST --data "{ \\"client_id\\": \\"%CLIENT_ID%\\", \\"client_secret\\": \\"%CLIENT_SECRET%\\" }" https://xray.cloud.getxray.app/api/v1/authenticate > token.txt
                    set /p XRAY_TOKEN=<token.txt
                """
            }
        }

        stage('Upload vers Xray') {
            steps {
                bat """
                    curl -H "Authorization: Bearer %XRAY_TOKEN%" -F "file=@output.xml" https://xray.cloud.getxray.app/api/v2/import/execution/robot
                """
            }
        }
    }
}
