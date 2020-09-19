terraform {
  backend "gcs" {
    bucket  = "tuba-fuchicorp"
    prefix  = "tools/common_tools"
    project = "automated-ray-287203"
  }
}
