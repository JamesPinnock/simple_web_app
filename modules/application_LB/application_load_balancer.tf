# resource "aws_lb" "alb" {
#   name               = "dev-lb-tf"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_web_traffic.id]
#   subnets            = [aws_subnet.public_subnet.id,aws_subnet.private_subnet.id]

#   enable_deletion_protection = true

# #   access_logs {
# #     bucket  = aws_s3_bucket.lb_logs.bucket
# #     prefix  = "dev-lb"
# #     enabled = true
# #   }

#   tags = {
#     Environment = "development"
#   }
# }


# resource "aws_alb_target_group" "target-group-1" {
#   name = "target-group-1"
#   port = 80
#   protocol = "HTTP"
# }


# resource "aws_alb_listener" "alb-listener" {
#   default_action {
#     target_group_arn = aws_alb_target_group.target-group-1.arn
#     type = "forward"
#   }
#   load_balancer_arn = "$WIP"
#   port = 80
#   protocol = "HTTP"
# }

# resource "aws_alb_listener_rule" "rule-1" {
#   action {
#     target_group_arn = aws_alb_target_group.target-group-1.arn
#     type = "forward"
#   }

# #   condition { field="path-pattern" values=["/api/1/resolve/default"] }

#   listener_arn = aws_alb_listener.alb-listener.arn
#   priority = 100
# }

# resource "aws_autoscaling_group" "alb-asg" {
#   name = "alb-asg"
#   min_size = "3"
#   max_size = "6"


#   target_group_arns = [
#     "$WIP",
#     "$WIP",
#   ]

#   lifecycle {
#     create_before_destroy = true
#   }
# }