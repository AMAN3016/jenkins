provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "jenkins-training-vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.jenkins-training-vpc.id}"

  tags {
    Name = "${var.vpc_name}-igw"
  }
}
