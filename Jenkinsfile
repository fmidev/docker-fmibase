pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('Build') {
      steps {
            sh './build.sh'
	}
    }
    stage('Test preparation') {
      steps {
        sh 'mkdir -m 777 -p tmp-yum-cache'
      }
    }
    stage('Test yum cache creation') {
      agent {
        docker {
          image 'fmibase'
          args '-v ${PWD}/tmp-yum-cache:/var/cache/yum -v ${PWD}:/work -w /work'
        }
      }
      steps {
        sh './test-inside-container-1.sh'
      }
    }
    stage('Test yum cache contents') {
      agent {
        docker {
          image 'fmibase'
          args '-v ${PWD}/tmp-yum-cache:/var/cache/yum -v ${PWD}:/work -w /work'
        }
      }
      steps {
        sh './test-inside-container-2.sh'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'rm -rf tmp-yum-cache'
      }
    }
  }
}
