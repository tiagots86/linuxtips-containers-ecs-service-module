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

}

variable "service_cpu" {

}

variable "service_memory" {

}

variable "service_listener" {

}

variable "service_task_execution_role" {

}

variable "environment_variables" {
  type = list(any)

}

variable "secrets" {
  type = list(object({
    name: string
    valueFrom: string
  }))
  description = "Lista de secrets do parameter store ou do secrets manager"
  default = []
}

variable "capabilities" {
  type = list(any)
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
    file_system_id: string
    file_system_root: string
    mount_point: string
    ready_only: bool
  }))
  default = []
}
