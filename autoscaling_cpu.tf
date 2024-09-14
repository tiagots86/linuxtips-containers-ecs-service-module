resource "aws_appautoscaling_policy" "cpu_high" {
  count = var.scale_type == "cpu" ? 1 : 0

  resource_id        = aws_appautoscaling_target.main.resource_id
  service_namespace  = aws_appautoscaling_target.main.service_namespace
  scalable_dimension = aws_appautoscaling_target.main.scalable_dimension

  name = format("%s-%s-cpu-scale-out", var.cluster_name, var.service_name)

  policy_type = "StepScaling"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = var.scale_out_coodown
    metric_aggregation_type = var.scale_out_statistic

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = var.scale_out_adjustment
    }
  }
}