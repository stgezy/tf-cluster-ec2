
# Define AWS provider
provider "aws" {
  region = "us-west-2"
}

# Create a security group for the cluster
resource "aws_security_group" "cluster_sg" {
  name_prefix = "cluster_sg"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create launch configuration
resource "aws_launch_configuration" "cluster_lc" {
  name_prefix = "cluster_lc"
  image_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.cluster_sg.id]
}

# Create auto scaling group
resource "aws_autoscaling_group" "cluster_asg" {
  name_prefix = "cluster_asg"
  availability_zones = ["us-west-2a", "us-west-2b"]
  desired_capacity = 2
  min_size = 2
  max_size = 4

  launch_configuration = aws_launch_configuration.cluster_lc.name

  tag {
    key = "Name"
    value = "cluster-node"
    propagate_at_launch = true
  }
}# Define AWS provider
provider "aws" {
  region = "us-west-2"
}

# Create a security group for the cluster
resource "aws_security_group" "cluster_sg" {
  name_prefix = "cluster_sg"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create launch configuration
resource "aws_launch_configuration" "cluster_lc" {
  name_prefix = "cluster_lc"
  image_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.cluster_sg.id]
}

# Create auto scaling group
resource "aws_autoscaling_group" "cluster_asg" {
  name_prefix = "cluster_asg"
  availability_zones = ["us-west-2a", "us-west-2b"]
  desired_capacity = 2
  min_size = 2
  max_size = 4

  launch_configuration = aws_launch_configuration.cluster_lc.name

  tag {
    key = "Name"
    value = "cluster-node"
    propagate_at_launch = true
  }
}