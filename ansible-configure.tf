###################################################
######## Configure instances using ansible ########
###################################################

resource "null_resource" "configure_aws_k8s_master" {
  depends_on = [aws_instance.k8s_master, ansible_host.aws_k8s_master]

  provisioner "local-exec" {
    command = "ansible-playbook ansible/aws/configure-k8s-master.yaml -i ansible-inventory"
  }
}

resource "null_resource" "configure_aws_k8s_worker" {
  depends_on = [null_resource.configure_aws_k8s_master, aws_instance.k8s_worker, ansible_group.aws_k8s_nodes] # , ansible_host.aws_k8s_node

  triggers = {
    cluster_instance_ids = join(", ", aws_instance.k8s_worker.*.id)
  }

  provisioner "local-exec" {
    command = "ansible-playbook ansible/aws/configure-k8s-worker.yaml -i ansible-inventory"
  }
}