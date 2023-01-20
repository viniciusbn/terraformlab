terraform {
  cloud {
    organization = "vinibackes"

    workspaces {
      name = "terraformlab-alura"
    }
  }
}