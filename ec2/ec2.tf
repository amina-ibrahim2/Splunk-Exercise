resource "aws_instance" "splunk_ec2" {
  ami           = data.aws_ami.splunk.id
  instance_type = "t2.medium"

  security_groups = [aws_security_group.splunksg.name]

  tags = {
    Name = "SplunkInstance"
  }
}