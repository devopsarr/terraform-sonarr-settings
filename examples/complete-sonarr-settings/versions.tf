terraform {
  required_providers {
    sonarr = {
      source  = "devopsarr/sonarr"
      version = ">= 2.1.0"
    }
  }
  required_version = ">= 1.0"
}