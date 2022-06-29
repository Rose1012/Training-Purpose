
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "ap-south-1"
}

resource "aws_instance" "terraform_demo" { 
 ami = "ami-04893cdb768d0f9ee" 
 instance_type = "t2.micro" 
} 

resource "aws_vpc" "devops-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = { 
   Name = "testingourvpc" 
   Environment = "devenv" 
 } 
}
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.devops-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  
  tags = { 
   Name = "public_subnet" 
   Environment = "devenv" 
 } 
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.devops-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1c"
  tags = { 
   Name = "private_subnet" 
   Environment = "devenv" 
 }
}
