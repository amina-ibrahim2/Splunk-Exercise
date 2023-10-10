resource "aws_security_group" "splunksg" {
  name        = "SplunkSecGroup"
  description = "Allow-on-port-8000"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["107.208.135.39/32"] # Replace 'YOUR_PUBLIC_HERE' with your public IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}