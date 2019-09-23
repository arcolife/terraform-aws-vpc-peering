provider "aws" {
  alias = "src"
  region = "ca-central-1"
}
provider "aws" {
  alias = "dst"
  region = "eu-west-3"
}
