resource "aws_security_group" "cluster" {
  description = "EKS cluster security group."
  name        = "${var.organization_name}-eks-${lookup(var.environment, terraform.workspace)}"
  vpc_id      = module.network.vpc_id

  tags = {
    Name    = "${var.organization_name}-eks-${lookup(var.environment, terraform.workspace)}"
    service = "eks"
  }
}

resource "aws_security_group_rule" "cluster_egress_internet" {
  description       = "Allow cluster egress access to the Internet."
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cluster.id
}


resource "aws_security_group_rule" "cluster_private_access_cidrs_source" {
  description       = "Allow private K8S API ingress from custom CIDR source."
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [lookup(var.vpc_cidr_block, terraform.workspace)]
  security_group_id = aws_security_group.cluster.id
}
