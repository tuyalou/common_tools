module "sonarqube_deploy" {
  source                 = "fuchicorp/chart/helm"
  deployment_name        = "sonarqube"
  deployment_environment = "${kubernetes_namespace.service_tools.metadata.0.name}"
  deployment_endpoint    = "sonarqube.${var.google_domain_name}"
  deployment_path        = "sonarqube"

  template_custom_vars = {

    null_depends_on      = "${null_resource.cert_manager.id}"
    sonarqube_ip_ranges  =  "${var.common_tools["ip_ranges"]}"
  }
}

resource "kubernetes_secret" "sonarqube-admin-access" {
   metadata {
    name = "sonarqube-admin-access"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Sonarqube Creds"
    }
    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.sonarqube["username"]}"
    "password" = "${var.sonarqube["admin_password"]}"
  }
}

resource "kubernetes_secret" "aws-access-dev" {
   metadata {
    name = "aws-access-dev"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Sonarqube Creds"
    }
    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.AWS_ACCESS_KEY_ID}"
    "password" = "${var.AWS_SECRET_ACCESS_KEY}"
  }
}

resource "kubernetes_secret" "aws-access-qa" {
   metadata {
    name = "aws-access-qa"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Sonarqube Creds"
    }
    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.AWS_ACCESS_KEY_ID}"
    "password" = "${var.AWS_SECRET_ACCESS_KEY}"
  }
}

resource "kubernetes_secret" "aws-access-stage" {
   metadata {
    name = "aws-access-stage"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Sonarqube Creds"
    }
    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.AWS_ACCESS_KEY_ID}"
    "password" = "${var.AWS_SECRET_ACCESS_KEY}"
  }
}

resource "kubernetes_secret" "aws-access-prod" {
   metadata {
    name = "aws-access-prod"
    namespace = "tools"
    annotations {
        "jenkins.io/credentials-description" = "Sonarqube Creds"
    }
    labels {
        "jenkins.io/credentials-type" = "usernamePassword"
    }
  }

  data = {
    "username" = "${var.AWS_ACCESS_KEY_ID}"
    "password" = "${var.AWS_SECRET_ACCESS_KEY}"
  }
}