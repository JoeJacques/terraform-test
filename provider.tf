provider "aws" {
  region = var.region
}

# NOT CCOMMITING KEYS PLEASE USE LOCAL SECRET KEYS FROM YOUR ENV

# Can use S3 or Terraform cloud backend as a more secure method
# For the purposes of this test I will be a local .tfstate file.



