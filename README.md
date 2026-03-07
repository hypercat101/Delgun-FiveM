# Delgun

A FiveM script that allows  users to delete targeted vehicles by aiming at them.

## Installation

1.  Download the script from [GitHub].
2.  Extract the `delgun` folder into your `resources` directory.
3.  Add `start delgun` to your `server.cfg`.

## Configuration

The configuration file is located at `config.lua`.

| Option | Description | Default |
| --- | --- | --- |
| `Config.DelgunPermission` | The AcePerms permission required to use the delgun. | `delgun.use` |
| `Config.ActivationKey` | The key to activate the delgun. | `170` (INPUT_VEH_HEADLIGHT) |
| `Config.MaxRange` | The maximum range of the delgun. | `100.0` |
| `Config.Messages` | The messages displayed to the user. | (see `config.lua`) |

## Permissions

To grant a user permission to use the delgun, add the following to your `server.cfg`:

```
add_ace group.admin delgun.use allow
```

This will grant the `admin` group permission to use the delgun. You can change the group to whatever you want.

