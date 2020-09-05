pipeline {
    agent {label  'slave'}
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t 123123123123123456/jenkins_pydev:v1.0'
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
               sh 'docker run -d -p 8000:3030 123123123123123456/jenkins_pydev:v1.0'
            }
           
        }
    }
}
