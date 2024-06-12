data "aws_ami" "ansible_practice" {
  most_recent = true
  owners      = ["973714476881"]
  
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}

data "aws_security_group" "sg_id" {
  name   = "allow-everything"
}

data "aws_route53_zone" "zone_id" {
  name   = "rajasekhar.online"
}