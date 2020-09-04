pipeline {
    agent {label  'slave'}
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t 123123123123123456/jenkins_pymaster:v1.0'
            }
             post{
             success{
                slackSend(color:'#00FF00',message:'successful')
            }
             failure{
                slackSend(color:'#FF0000',message:'failure')
            }
             aborted{
                slackSend(color:'#FFFF00',message:'aborted')
            }
            }
        }
        stage('push') {
            steps {
                withCredentials([usernamePassword(credentialsid:"docker",usernamevariable:"USERNAME",passwordvariable:"Password")]){
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push 123123123123123456/jenkins_pymaster:v1.0'
                }
            
            }
        }
        stage('Deploy') {
            steps {
               sh 'docker run -d -p 8000:4000 123123123123123456/jenkins_pymaster:v1.0'
            }
           
        }
    }
}
