variable "region" {

}

variable "service_name" {

}

variable "container_image" {
  type        = string
  description = "imagem com tag para deployment de aplicação no ecs"

}

variable "cluster_name" {

}

variable "vpc_id" {

}

variable "private_subnets" {

}

variable "service_port" {
  type        = number
  description = "Porta na qual o serviço estará acessível."
}

variable "service_cpu" {
  type        = number
  description = "Quantidade de CPU alocada para o serviço, especificada em unidades de CPU do ECS."
}

variable "service_memory" {
  type        = number
  description = "Quantidade de memória alocada para o serviço, especificada em MB."
}

variable "service_listener" {
  type        = string
  description = "ARN do listener do Application Load Balancer que será usado pelo serviço."
  default     = null
}

variable "service_task_execution_role" {
  type        = string
  description = "ARN da role de execução de tarefas do ECS que o serviço usará para executar."
}

variable "environment_variables" {
  type = list(object({
    name : string
    value : string
  }))
}

variable "secrets" {
  type = list(object({
    name : string
    valueFrom : string
  }))
  description = "Lista de secrets do parameter store ou do secrets manager"
  default     = []
}

variable "capabilities" {
  type        = list(string)
  default     = []
  description = "Lista de capacidades, como EC2 ou FARGATE"
}

variable "service_healthcheck" {
  type = map(any)
}

# variable "service_launch_type" {

# }

variable "service_launch_type" {
  type = list(object({
    capacity_provider = string
    weight            = number
  }))
  default = [{
    capacity_provider = "SPOT"
    weight            = 100
  }]
}

variable "service_task_count" {

}

variable "service_hosts" {

}

variable "scale_type" {
  default = null
}

variable "task_minimum" {
  default = 3
}

variable "task_maximum" {
  default = 10
}

#Autoscaling CPU

variable "scale_out_cpu_threshold" {
  default = 80
}

variable "scale_out_adjustment" {
  default = 1
}

variable "scale_out_comparison_operator" {
  default = "GreaterThanOrEqualToThreshold"
}

variable "scale_out_statistic" {
  default = "Average"
}

variable "scale_out_period" {
  default = 60
}

variable "scale_out_evaluation_periods" {
  default = 2
}

variable "scale_out_coodown" {
  default = 60
}

variable "scale_in_cpu_threshold" {
  default = 30
}

variable "scale_in_adjustment" {
  default = -1
}

variable "scale_in_comparison_operator" {
  default = "LessThanOrEqualToThreshold"

}

variable "scale_in_statistic" {
  default = "Average"

}

variable "scale_in_period" {
  default = 120
}

variable "scale_in_evaluation_periods" {
  default = 3

}

variable "scale_in_coodown" {
  default = 120


}

variable "scale_tracking_cpu" {
  default = 80

}

variable "alb_arn" {
  default = null

}

variable "scale_tracking_requests" {
  default = 0


}

variable "efs_volumes" {
  type = list(object({
    volume_name : string
    file_system_id : string
    file_system_root : string
    mount_point : string
    ready_only : bool
  }))
  default = []
}

variable "service_discovery_namespace" {
  description = "Namespace ID do Service Discovery"
  default     = null

}

variable "service_protocol" {
  type    = string
  default = null
}

variable "protocol" {
  type    = string
  default = "tcp"
}

variable "use_service_connect" {
  type    = bool
  default = false
}

variable "service_connect_name" {
  type    = string
  default = null
}

variable "service_connect_arn" {
  type    = string
  default = null
}

variable "use_alb" {
  type        = bool
  default     = true
  description = "Habilita a exposição do serviço via load balancer"
}

variable "deployment_controller" {
  type    = string
  default = "ECS"
}

variable "codedeploy_strategy" {
  type    = string
  default = "CodeDeployDefault.ECSAllAtOnce"
}

variable "codedeploy_deployment_option" {
  type    = string
  default = "WITH_TRAFFIC_CONTROL"

}

variable "codedeploy_deployment_type" {
  type    = string
  default = "BLUE_GREEN"
}

variable "codedeploy_termination_wait_time_in_minutes" {
  type    = number
  default = 2
}

variable "codedeploy_rollback_alarm" {
  type    = bool
  default = true
}

variable "codedeploy_rollback_error_threshold" {
  type    = number
  default = 10
}

variable "codedeploy_rollback_error_period" {
  type    = number
  default = 60
}

variable "codedeploy_rollback_error_evaluation_period" {
  type    = number
  default = 1
}