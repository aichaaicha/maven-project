pipeline {
    agent any

    stages {
        stage('Build') {
            steps{
                bat 'mvn clean package'
              }
            post{
                success{
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deploy to staging env') {
            steps {
                buil job: 'deploy-to-staging'
            }
        }
    }
}
