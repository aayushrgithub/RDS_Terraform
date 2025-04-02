terraform {
  backend "s3" {
    bucket         = "bucket02042025"
    key            = "terraform.tfstate"
    region         = "eu-north-1" # 🔹 AWS Region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
