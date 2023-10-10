# create vpc
resource "aws_vpc" "splunk_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "splunk_internet_gateway" {
  vpc_id = aws_vpc.splunk_vpc.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create public subnet az1
resource "aws_subnet" "public_splunk_subnet_az1" {
  vpc_id                  = aws_vpc.splunk_vpc.id
  cidr_block              = public_subnet_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones .available_zones.names [0]

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-az1"
  }
}



# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.splunk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"  #route traffic anywhere 
    gateway_id = aws_internet_gateway.splunk_internet_gateway.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}


# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      = aws_subnet.public_splunk_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}






# create private data subnet az1
#resource "aws_subnet" "private_data_subnet_az1" {
  #vpc_id                  = 
  #cidr_block              = 
  #availability_zone       = 
  #map_public_ip_on_launch = 

  #tags = {
   # Name = "${}-${}-private-data-az1"
 # }
#}

