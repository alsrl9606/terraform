resource "aws_launch_configuration" "cmk_lacf" {
  name = "cmk-web"
   image_id      = aws_ami_from_instance.cmk_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin1"
  security_groups = [ aws_security_group.cmk_websg.id ]
  key_name = "th-key"
  user_data = <<-EOF
        #!/bin/bash
        systemctl start httpd
        systemctl enable httpd
        EOF
  lifecycle {
    
    create_before_destroy = true

  }

  }