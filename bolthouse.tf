provider "aws" {
  region     = "us-west-2"
}

# note that this default can still be overridden via the “-var” command line option
#"${var.server_port}"
# remove default to prompt at plan time
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

resource "aws_eip" "bolthouse-josie-meetcarrot-eip" {
  instance = "${aws_instance.bolthouse.id}"
  vpc      = true
  tags = { Name = "bolthouse-meetcarrot-eip" }
}

#resource "aws_instance" "management-josie-knotis" {
resource "aws_instance" "bolthouse" {
  #ami           = "ami-2757f631"
  #id            = "i-0073f8c4f313aec17"
  ami           = "ami-005bdb005fb00e791"
  #instance_type = "t3.small"
  instance_type = "t3a.micro"
  tags = {
    Name = "bolthouse-josie-meetcarrot-ec2"
    #Name = "terraform-management-josie-knotis-ec2"
  }
  security_groups = ["josie-test-web", "dns-josie-aws"]
  ebs_optimized = true
  root_block_device { 
      volume_size = 80 
      #device_name = "/dev/sdg"
      }

  key_name = "josie-aws-mar-2019"
  availability_zone = "us-west-2b"

#  ebs_block_device { "management-josie-knotis-ebs" }

#      arn:                          <computed>
#      associate_public_ip_address:  <computed>
#      availability_zone:            <computed>
#      cpu_core_count:               <computed>
#      cpu_threads_per_core:         <computed>
#      ebs_block_device.#:           <computed>
#      ephemeral_block_device.#:     <computed>
#      get_password_data:            "false"
#      host_id:                      <computed>
#      instance_state:               <computed>
#      instance_type:                "t3.large"
#      ipv6_address_count:           <computed>
#      ipv6_addresses.#:             <computed>
#      key_name:                     <computed>
#      network_interface.#:          <computed>
#      network_interface_id:         <computed>
#      password_data:                <computed>
#      placement_group:              <computed>
#      primary_network_interface_id: <computed>
#      private_dns:                  <computed>
#      private_ip:                   <computed>
#      public_dns:                   <computed>
#      public_ip:                    <computed>
#      root_block_device.#:          <computed>
#      security_groups.#:            <computed>
#      source_dest_check:            "true"
#      subnet_id:                    <computed>
#      tenancy:                      <computed>
#      volume_tags.%:                <computed>
#      vpc_security_group_ids.#:     <computed>
}

#resource "aws_instance" "management2-josie-knotis" {
#  #ami           = "ami-2757f631"
#  ami           = "ami-005bdb005fb00e791"
#  instance_type = "t3.large"
#  tags = {
#    Name = "management2-josie-knotis-ec2"
#  }
#  security_groups = ["josie-test-web"]
#  ebs_block_device = { 
#      volume_size = 80 
#      device_name = "/dev/sdg"
#      }
#
#  key_name = "josie-aws-mar-2019"
#  }

#resource "aws_instance" "steve-server" {
#  #ami           = "ami-2757f631"
#  ami           = "ami-005bdb005fb00e791"
#  #instance_type = "t3.small"
#  instance_type = "t2.nano"
#  tags = {
#    Name = "terraform-management-steve-knotis-ec2"
#  }
#  security_groups = ["josie-test-web"]
#  root_block_device = { 
#      volume_size = 80 
#      #device_name = "/dev/sdg"
#      }
#
#  key_name = "josie-aws-mar-2019"
#}


#Resource "aws_ebs_volume" "maagement-josie-knotis-ebs" {
#  availability_zone = "us-west-2a"
#  size              = 80
#
#  tags = {
#    Name = "management-josie-knotis-ebs"
#  }
#}
#:

#resource "aws_elb" "example" {
#  name = "terraform-asg-example"
#  availability_zones = ["${data.aws_availability_zones.us-west-2.names}"]
#}
