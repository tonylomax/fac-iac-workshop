resource "aws_ecr_repository" "fac-repo" {
  name                 = ""
  image_tag_mutability = ""

  image_scanning_configuration {
    scan_on_push = true
  }
}