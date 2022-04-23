terraform { #putting all of my required providers here just because. I could consolidate everything into a single file, but I don't want to.
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {} #Use Environment variable for GITHUB_TOKEN

resource "github_repository" "terraform_example" {
  name = "terraform-repo"
  visibility = "private"
  vulnerability_alerts = true
}