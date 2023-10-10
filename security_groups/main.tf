resource "aws_security_group" "splunk_server_sg" {
  name_prefix = "splunk-group"

  ingress {
    from_port = 22 # ssh port 
    to_port =  22 
    protocol = "tcp"
    cidr_blocks = ["107.208.135.39/32"]

  }

  ingress {
    from_port = 8000 # Web UI port
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["107.208.135.39/32"]

  }
}