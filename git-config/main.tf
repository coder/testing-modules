terraform {
  required_version = ">= 1.0"

  required_providers {
    coder = {
      source  = "coder/coder"
      version = ">= 0.12"
    }
  }
}

variable "agent_id" {
    type = string
    description = "The ID of a Coder agent."
}

# TODO: Check if agent ID can provide workspace username and email
variable "username" {
  type = string
  description = "The username of the Coder workspace owner."
}

variable "user_email" {
  type = string
  description = "The email of the Coder workspace owner."
}

resource "coder_script" "personalize" {
    agent_id = var.agent_id
    script = templatefile("${path.module}/run.sh", {
      CODER_USERNAME = var.username,
      CODER_EMAIL = var.user_email
    }) 
    display_name = "Git Config"
    icon = "/emojis/1f58c.png"                          # TODO: test if the local git icon works
    run_on_start = true
}
