
locals {
  source_input = "version-2"
}

resource "terraform_data" "source" {
  input = local.source_input

  lifecycle {
    precondition {
      condition     = length(local.source_input) > 0
      error_message = "Source input must not be empty."
    }

    postcondition {
      condition     = self.output == "version-2"
      error_message = "Source output must equal version-2."
    }
  }
}

resource "terraform_data" "lifecycle_demo" {
  input = "demo-resource"

  lifecycle {
    replace_triggered_by = [
      terraform_data.source
    ]
  }
}
