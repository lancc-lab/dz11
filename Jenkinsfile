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

    stage('Make docker image and push') {
      steps {
        sh 'cp /var/lib/jenkins/workspace/d.z_pipeline/my_password.txt /root/my_password.txt '
        sh 'docker build -t boxfuse_build .'
        sh 'cat ~/my_password.txt | docker login 192.168.1.30:8123 --username admin --password-stdin'
        sh '''docker tag boxfuse_build 192.168.1.30:8123/boxfuse_build && docker push 192.168.1.30:8123/boxfuse_build'''

      }
  
    }
  }
 }
