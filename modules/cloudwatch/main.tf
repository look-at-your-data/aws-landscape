resource "aws_cloudwatch_metric_alarm" "Low_Disk_Space_kafkaInstance" {
  alarm_name                = "Disk_Space_kafkaInstance"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "disk_used_percent"
  namespace                 = "CWAgent"

  dimensions {
      InstanceId    = "i-xxxxxxxxxxxxxxxxx"
      ImageId       = "your-image-id"
      InstanceType  = "your-instance-type"
      path          = "/"
      device        = "your-device"
      fstype        = "xfs"

  }

  period                    = "60"
  statistics                = "Maximum"
  threshold                 = "90" 
  alarm_description         = "Disk usage for / is high"
  insufficient_data_actions = []
  actions_enabled           = true
  alarm_actions             = ["arn:aws:sns:xxxxxx"]
  ok_actions                = ["arn:aws:sns:xxxxxx"]
}
