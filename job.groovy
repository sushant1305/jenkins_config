pipelineJob('courier_management') {
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('https://github.com/sushant1305/courier_management.git')
          }
          branch('feature/dev')
        }
      }
      scriptPath("Jenkinsfile")
      lightweight()
    }
  }
}
