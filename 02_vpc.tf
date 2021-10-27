resource "aws_vpc" "cmk_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      name = "cmk-vpc"
  }
}