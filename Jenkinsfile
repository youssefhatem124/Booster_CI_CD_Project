pipeline {
    agent {label  'slave'}
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t 123123123123123456/jenkins_pydev:v1.0'
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
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'docker',usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]){                sh 'docker push 123123123123123456/jenkins_pydev:v1.0'
                }
            }
            }

        stage('Deploy') {
            steps {
               sh 'docker run -d -p 4040:8000 123123123123123456/jenkins_pydev:v1.0'
            }
           
        }
    }
}
