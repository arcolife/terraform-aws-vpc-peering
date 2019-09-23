resource "aws_vpc_peering_connection" "default" {
  provider = "aws.src"

  count = length(local.peer_regions_list)
  
  peer_vpc_id   = local.peer_regions_list[count.index].acceptor_vpc_id
  vpc_id        = local.peer_regions_list[count.index].requestor_vpc_id

  peer_region = local.peer_regions_list[count.index].peer_region

  auto_accept = "${var.auto_accept}"

  tags = {
    # A bit opinionated here, but this will fail without a Name tag. Seems like a good practice to have anyhow.
    Name    = "${local.peer_regions_list[count.index].deploy_region} to ${local.peer_regions_list[count.index].peer_region}"
    Comment = "Managed By Terraform"
  }
}
