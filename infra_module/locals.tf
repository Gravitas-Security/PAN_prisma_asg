# Locals for mappings
locals {
  region_map = {
    "us-east-1"      = "ami-04607de185d0f0bc4"
    "us-east-2"      = "ami-0986571b2e707fabf"
    "us-west-1"      = "ami-04b093473dba5ae28"
    "us-west-2"      = "ami-04aa50b42972bed97"
    "ca-central-1"   = "ami-0c1d2704dbfd0c642"
    "eu-central-1"   = "ami-00a7c85ca30032549"
    "eu-central-2"   = "ami-0d688c146dce25ec2"
    "eu-west-1"      = "ami-032e081755e45dc81"
    "eu-west-2"      = "ami-04c3276680b59e0ec"
    "eu-west-3"      = "ami-0619a0e2cb462be89"
    "ap-southeast-1" = "ami-0944ff7eb62413996"
    "ap-southeast-2" = "ami-08a263a8e65cac192"
    "ap-southeast-3" = "ami-005b6b05cb73247b9"
    "ap-southeast-4" = "ami-0c3eed3f53185a204"
    "ap-south-1"     = "ami-0285a74981328ae3f"
    "ap-south-2"     = "ami-028c671c6cb485f0b"
    "ap-northeast-1" = "ami-07ae5e31a2976240a"
    "ap-northeast-2" = "ami-0db9296948668308b"
    "ap-northeast-3" = "ami-01619fbda3693c458"
    "sa-east-1"      = "ami-087ddfd8226b61a94"
    "eu-north-1"     = "ami-0e6d02d1931c66d3c"
    "ap-east-1"      = "ami-02535ff34f9d0d603"
    "me-south-1"     = "ami-0d892c07a074f5cc1"
    "me-central-1"   = "ami-0ac02ecb3527141d1"
    "af-south-1"     = "ami-0034cb279def0616e"
    "eu-south-1"     = "ami-0446c494cded6fab6"
    "eu-south-2"     = "ami-02b9ae6c5c6bf919c"
    "ca-west-1"      = "ami-0803f49256facb017"
    "il-central-1"   = "ami-07980092312268a80"
    "us-gov-east-1"  = "ami-0525bc7c66582b4c6"
    "us-gov-west-1"  = "ami-0fddbb8f3f06c01a9"
  }

  instance_map = {
    "ion200v" = "m5.xlarge"
  }

  bandwidth_map = {
    "10"  = 805306368,
    "20"  = 1610612736,
    "30"  = 2415919104,
    "40"  = 3221225472,
    "50"  = 4026531840,
    "60"  = 4831838208,
    "70"  = 5637144576,
    "80"  = 6442450944,
    "90"  = 7247757312,
    "100" = 8053063680
  }
}