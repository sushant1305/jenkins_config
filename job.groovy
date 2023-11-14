pipelineJob('courier_management') {
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('git@github.com:sushant1305/courier_management.git')
          }
          branch('feature/docker_img')
        }
      }
      scriptPath("Jenkinsfile")
      lightweight()
    }
  }
}