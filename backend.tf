# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "mysplunkexercise"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    #dynamodb_table = "terraform-lock-table"
  }
}

