output "ec2_ssm_instance_profile_name" {
  description = "IAM instance profile for EC2"
  value       = aws_iam_instance_profile.ec2_ssm_instance_profile.name
}
