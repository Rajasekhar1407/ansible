resource "aws_instance" "ansible_practice" {
  count = 2 
  ami = data.aws_ami.ansible_practice.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg_id.id]
  tags = {
    Name = "ansible-practice-${count.index}"
  }
  user_data = count.index == 0 ? file("user_data.sh") : ""
}

resource "aws_route53_record" "ansible_practice" {
  zone_id = data.aws_route53_zone.zone_id.zone_id
  name    = "ansible.rajasekhar.online"
  type    = "A"
  ttl     = 1
  records = [aws_instance.ansible_practice.1.private_ip]
}