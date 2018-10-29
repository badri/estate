terraform {
  version = "0.11.10"
}

providers {
  aws = ["~> 1"]
  template = ["~> 1.0"]
  digitalocean = ["~> 1.0"]
  local = ["~> 1.1"]
}
