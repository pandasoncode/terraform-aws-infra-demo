resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier          = "${var.rds_instance_name}-rds-cluster"
  engine                      = "aurora-postgresql"
  engine_mode                 = "provisioned"
  engine_version              = "16.1"
  database_name               = "postgres"
  master_username             = "postgres"
  manage_master_user_password = true
  storage_encrypted           = true

  serverlessv2_scaling_configuration {
    max_capacity = 12
    min_capacity = 0.5
  }

  tags = {
    Name = "${var.rds_instance_name}-rds-cluster"
  }

  availability_zones              = slice(var.availability_zones, 0, 3)
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.rds_parameter_group.name
  db_subnet_group_name            = aws_db_subnet_group.rds_subnet_group.name
  # skip_final_snapshot             = true
  apply_immediately               = true
  vpc_security_group_ids          = [aws_security_group.rds_sg.id]

  depends_on = [aws_db_subnet_group.rds_subnet_group, aws_rds_cluster_parameter_group.rds_parameter_group]
}

resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  count              = length(slice(var.availability_zones, 0, 3))
  identifier         = "${var.rds_instance_name}-rds-cluster-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.rds_cluster.cluster_identifier
  instance_class     = "db.serverless"
  engine             = aws_rds_cluster.rds_cluster.engine
  engine_version     = aws_rds_cluster.rds_cluster.engine_version
  tags = {
    Name = "${var.rds_instance_name}-rds-cluster-instance-${count.index + 1}"
  }
  availability_zone = var.availability_zones[count.index]
}
