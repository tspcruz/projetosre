output "alb_dns_name" {
  value       = module.aplicacao.alb_dns_name
  description = "The domain name of the load balancer"
}
output "asg_name" {
  value       = module.aplicacao.asg_name
  description = "The name of the Auto Scaling Group"
}
