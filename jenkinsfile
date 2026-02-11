pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm  //Git
            }
        }
        
        stage('Installation des dépendances') {
            steps {
                sh 'pip3 install -r requirements.txt'  // à la place de maven 
            }
        }
        
        stage('Exécution des tests') {
            steps {
                sh 'robot --outputdir results tests/'  // on remplce le mvn test 
            }
        }
        
        stage('Publication des résultats') {
            steps {
                robot outputPath: 'results'  // c'est le plugin de robot framework
            }
        }
    }
}