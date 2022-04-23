provider "github" {} #Use Environment variable for GITHUB_TOKEN

resource "github_repository" "terraform_example" {
  name = "terraform-repo"
  visibility = "private"
}