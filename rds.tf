data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id
}

locals {
  db_credentials = jsondecode(aws_secretsmanager_secret_version.db_secret_version.secret_string)
}

resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  db_name              = "myrdsdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = local.db_credentials["username"]
  password             = local.db_credentials["password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
