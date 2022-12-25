resource "ansible_group" "aws_k8s_nodes" {
  inventory_group_name = "aws-k8s-nodes"
  children             = [for i in range(var.aws_nodes) : format("aws-k8s-node-%d", i)]
}

resource "ansible_group" "aws_k8s" {
  inventory_group_name = "aws-k8s"
  children             = ["aws-k8s-master", "aws-k8s-nodes"]
}

resource "ansible_group" "k8s-nodes" {
  inventory_group_name = "k8s-nodes"
  children             = ["aws-k8s-nodes"]
}