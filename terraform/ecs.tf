resource "aws_ecs_cluster" "fac" {
  name = "fac"

  
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
  task_definition = 
  desired_count   = 1


  load_balancer {
    
  }

  
}