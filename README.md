# Modules

Enjoy official, community, and partner modules to extend your Coder workspace.

- [code-server](https://registry.coder.com/modules/code-server): Run VS Code in the browser
- [personalize](https://registry.coder.com/modules/personalize): Execute a user-specific script on start
- [VS Code Desktop](https://registry.coder.com/modules/vscode-desktop): Display a button to launch VS Code desktop in the dashboard.

## Registry

Check out the [Coder Registry](https://registry.coder.com) for instructions to integrate modules into your template.

## Adding a new module

To quickly start contributing with a new module, clone this repository and run:

```sh
./new.sh
```

Test a module by running an instance of Coder on your local machine:

```bash
$ coder server --in-memory
```

Create a template and edit it to include your development module:

> *Info*
> The Docker starter template is recommended for quick-iteration!

```tf
module "testing" {
    source = "/home/user/coder/modules/my-new-module"
}
```

Now create a workspace, and any resources you've created in your module should appear! 🥳
