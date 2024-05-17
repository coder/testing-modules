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
  type        = string
  description = "The ID of a Coder agent."
}

variable "port" {
  type        = number
  description = "The port to run KasmVNC on."
  default     = 6800
}

variable "desktop_environment" {
  type        = string
  description = "The desktop environment to for KasmVNC (xfce, lxde, mate, etc)."
  default     = "lxde"
}

variable "kasm_version" {
  type        = string
  description = "Version of KasmVNC to install."
  default     = "1.3.1"
}

resource "coder_script" "kasm_vnc" {
  agent_id     = var.agent_id
  display_name = "KasmVNC"
  icon         = "/icon/kasmvnc.svg"
  script = templatefile("${path.module}/run.sh", {
    PORT : var.port,
    DESKTOP_ENVIRONMENT : var.desktop_environment,
    VERSION : var.kasm_version
  })
  run_on_start = true
}

resource "coder_app" "kasm_vnc" {
  agent_id     = var.agent_id
  slug         = "kasm-vnc"
  display_name = "kasmVNC"
  url          = "http://localhost:${var.port}"
  icon         = "/icon/kasmvnc.svg"
  subdomain    = true
  share        = "owner"
  healthcheck {
    url       = "http://localhost:${var.port}/app"
    interval  = 5
    threshold = 5
  }
}
