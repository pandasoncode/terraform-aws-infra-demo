resource "aws_rds_cluster_parameter_group" "rds_parameter_group" {
  name        = "${var.rds_instance_name}-rds-parameter-group"
  description = "${var.rds_instance_name}-rds-parameter-group"

  family = "aurora-postgresql16"


  parameter {
    name         = "icu_validation_level"
    value        = "disabled"
    apply_method = "pending-reboot"
  }

  parameter {
    name         = "rds.logical_replication"
    value        = "1"
    apply_method = "pending-reboot"
  }

  tags = {
    Name = "${var.rds_instance_name}-rds-parameter-group"
  }
}
