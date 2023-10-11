# Why outputs file?
# export attributes of resources so that we could reference in other modules

# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# export the environment
output "environment" {
  value = var.environment
}

# export the vpc id
output "vpc_id" {
  value = aws_vpc.splunk_vpc.id
}

# export the internet gateway
output "internet_gateway" {
  value = aws_internet_gateway.splunk_internet_gateway.id
}

# export the public subnet az1 id
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.arn
}

# export the first availability zone
output "availability_zone_1" {
  value = data.aws_availability_zones.available_zones.names[0]
}

output "splunk_public_ip" {
  value = aws_instance.splunk_ec2.public_ip
}

output "splunk_default_username" {
  value = "admin"
}

output "splunk_default_password" {
  value = "SPLUNK-${aws_instance.splunk_ec2.id}"
}