output "target_group" {
    value       = aws_lb_target_group.nlb_targets.arn
}

output "web_target_group" {
    value       = aws_lb_target_group.web_traffic.arn
}


