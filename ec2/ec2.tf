resource "aws_instance" "splunk_server" {
    ami           = "ami-0e40787bcd2f11bbb"    # us-east-1 AMI Splunk
    instance_type = "t2.micro"
    associate_public_ip_address = true # assign public ip
    key_name = "your-key-pair-name"
    #security_group = [aws_security_group.splunk_server_sg.name]
    #subnet_id = "${aws_subnet.splunk_server.id}"
  
}