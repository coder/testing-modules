---
display_name: Coder Login
description: Automatically logs the user into Coder on their workspace
icon: /emojis/1f511.png
maintainer_github: coder
verified: true
tags: [helper]
---

# Coder Login

Automatically logs the user into Coder when creating their workspace.

```hcl
module "coder-login" {
    agent_id = coder_agent.example.id
}
```