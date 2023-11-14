pipelineJob('courier_management') {
  options {
    buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
  }
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('https://github.com/sushant1305/courier_management.git')
          }
          branch('feature/docker_img')
        }
      }
      scriptPath("Jenkinsfile")
      lightweight()
    }
  }
}