resource "oci_core_vcn" "simple_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr_block
  display_name   = "${var.env}SimpleVCN"
  dns_label      = "simplevcn"
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.simple_vcn.id
  display_name   = "${var.env}SimpleInternetGateway"
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.simple_vcn.id
  display_name   = "${var.env}SimpleRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_subnet" "public_subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.simple_vcn.id
  cidr_block     = var.subnet_cidr_block
  display_name   = "${var.env}PublicSubnet"
  dns_label      = "public"
  route_table_id = oci_core_route_table.route_table.id
  security_list_ids = [oci_core_vcn.simple_vcn.default_security_list_id]
}
