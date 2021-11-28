resource "aws_eks_cluster" "example" {
  name     = local.resource_name
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    subnet_ids = split(",", "${module.network.private_subnet_ids}")
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceControllerPolicy,
  ]
}
