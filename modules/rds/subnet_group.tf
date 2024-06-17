resource "aws_db_subnet_group" "rds_subnet_group" {
  name        = "${var.rds_instance_name}-rds-subnet-group"
  description = "${var.rds_instance_name}-rds-subnet-group"
  subnet_ids  = var.subnet_ids

  tags = {
    Name = "${var.rds_instance_name}-rds-subnet-group"
  }
}
