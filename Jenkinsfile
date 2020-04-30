pipeline {
  agent {

    docker {
      image '192.168.1.30:8123/dz11'
      args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock'
    }

  }

  stages {

    stage('Copy source with configs') {
      steps {
        git 'https://github.com/lancc-lab/boxfuse.git'
        
      }
    }

    stage('Build war') {
      steps {
        sh 'mvn package'
      }
    }

    stage('Make docker image') {
      steps {
        sh 'cp /var/lib/jenkins/workspace/d.z_pipeline/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war && cp /var/lib/jenkins/workspace/d.z_pipeline/my_password.txt /root/my_password.txt '
        sh 'docker build -t dz11:1 .'
        sh 'cat ~/my_password.txt | docker login 192.168.1.30:8123 --username admin --password-stdin'
        sh '''docker tag dz11:1 192.168.1.30:8123/dz11:1 && docker push 192.168.1.30:8123/dz11:1'''

      }
    }

    stage('Run docker ') {
      steps {
       sh 'sudo docker pull 192.168.1.30:8123/dz11:1'
	        }
    }
  }
 }
