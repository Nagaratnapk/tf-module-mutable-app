data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "devws-tf-state-bucket"
    key    = "vpc/${var.ENV}/terrafom.tfstate"
    region = "us-east-1"
  }
}
# To read the data from the ALB state file
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "devws-tf-state-bucket"
    key    = "alb/${var.ENV}/terrafom.tfstate"
    region = "us-east-1"
  }
}

# DataSource to search the ami with given criteria.
data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "base-image-ansible"
  owners           = ["self"]
}