# configure aws provider to establish a secure connection between terraform and aws
provider "aws" {
  region  = "us-east-1"
  #profile = 
}

terraform {
   required_version = "= 1.6.0"
   required_providers {
    splunk = {
      source  = "splunk/splunk"
      version = "1.4.21"
    }
  }
}

provider "splunk" {
  url                  = "localhost:8089"
  username             = "admin"
  password             = "SPLUNK-$instance-id"
  insecure_skip_verify = true
}