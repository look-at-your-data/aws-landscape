resource "aws_cloudwatch_metric_alarm" "Disk_Space_kafkaInstance" {
  alarm_name                = "Disk_Space_kafkaInstance"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"

#   alarm_name                = "Disk_Space_"-${var.alertName}""
#   comparison_operator       = var.operator
#   evaluation_periods        = var.period
#   metric_name               = "disk_used_percent"
#   namespace                 = "CWAgent"

  dimensions {
      InstanceId    = "i-01fdc617e6e5016e1"
      path          = "/"
      device        = "your-device"
      fstype        = "xfs"

  }

  period                    = "5"
  statistics                = "Average"
  threshold                 = "50" 
  alarm_description         = "Disk usage for / is high"
  insufficient_data_actions = []
  actions_enabled           = true
  alarm_actions             = ["arn:aws:cloudwatch:ap-southeast-1:483506802077:alarm:Kafka Disk Space Metrics"]
  ok_actions                = ["arn:aws:cloudwatch:ap-southeast-1:483506802077:alarm:Kafka Disk Space Metrics"]
}
