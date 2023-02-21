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
                echo 'start deployment'
                build job: 'staging-env'
            }
        }

        stage ('Deploy to Production') {
            steps {
                timeout(time:5, unit: 'DAYS'){
                    input message: 'Approve PRODUCTION Deployment'
                }
                echo 'start deployment'
                build job: 'deploy-to-prod'
            }
            post{
                success{
                    echo 'Code deployed to Production'
                }
                failure{
                    echo 'Deployment failed'
                }
            }          
        }        
    }
}
