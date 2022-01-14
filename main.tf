module "network" {
  source           = "./modules/network"
  required_subnets = 2
}

module "network_load" {
   source       ="./modules/NLB"
   vpc_id = module.network.vpc_id
   subnet_id = [module.network.public_subnets.0]
}

module "autoscaling" {

  source             = "./modules/autoscaling"
  security_group_ids = [module.network.allow_all_security_group_id]
  subnet_id          = [module.network.public_subnets.0]
  instance_type      = var.instance_type
  user_data = templatefile("${var.scriptLocation}/install_ngxix.sh", 
  {
    test = "test"
  }
  )
  min_size = 1
  max_size = 4
  target_group_arns = [module.network_load.target_group]
}


