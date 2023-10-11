# configure aws provider to establish a secure connection between terraform and aws
provider "aws" {
  region  = "us-east-1"
  #profile = 
}

terraform {
   required_providers {
    splunk = {
      source  = "splunk/splunk"
    }
  }
}

provider "splunk" {
  url                  = "localhost:8089"
  username             = "admin"
  password             = "SPLUNK-$instance-id"
  insecure_skip_verify = true
}