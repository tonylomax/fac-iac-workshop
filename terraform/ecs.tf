resource "aws_ecs_cluster" "fac" {
  name = "fac"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "fac-task" {
  family                   = "fac-task"
  requires_compatibilities = [""]
  network_mode             = "awsvpc"
  cpu                      = 
  memory                   = 
  container_definitions    = <<TASK_DEFINITION
TASK_DEFINITION

  runtime_platform {
    operating_system_family = ""
    cpu_architecture        = ""
  }
}

resource "aws_ecs_service" "fac-service" {
  name            = "fac-service"
  cluster         = aws_ecs_cluster.fac.id
  task_definition = aws_ecs_task_definition.fac-task.arn
  desired_count   = 1


  load_balancer {
    target_group_arn = aws_lb_target_group.foo.arn
    container_name   = "mongo"
    container_port   = 8080
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  }
}