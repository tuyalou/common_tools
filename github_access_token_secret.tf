resource "kubernetes_secret" "github_access_token"{
    metadata {
        name = "github-access-token"
        namespace = "tools"
        annotations = { 
              "jenskins.io/credentials-description" = "jenkins library creds" 
              }       
        labels { 
              "jenkins.io/credentials-type" = "usernamePassword"
        }              
    }

    data = {
        "username" = "${var.jenkins["git_token"]}"
        "password" = ""
    }
}

resource "kubernetes_secret" "github_common_token"{
   metadata {
       name = "git-common-token"
       namespace = "tools"
       annotations {
           "jenkins.io/credentials-description" = "jenkins library creds"
    }
        labels {
            "jenkins.io/credentials-type" = "secretText"
        }
    }    
   data = {
       "text"    = "${var.jenkins["git_token"]}"
  }
} 