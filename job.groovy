pipelineJob('courier_management') {
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
pipelineJob('courier_management') {
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('git@github.com:sushant1305/cd.git')
          }
          branch('feature/dev')
        }
      }
      scriptPath("Jenkinsfile")
      lightweight()
    }
  }
}