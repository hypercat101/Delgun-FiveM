<div align="center">

# DELGUN-FIVEM

*Empower Moderation, Command Control Instantly and Securely*

![last commit](https://img.shields.io/github/last-commit/hypercat101/Delgun-FiveM?label=last%20commit&color=blue)
![lua](https://img.shields.io/badge/lua-100.0%25-blue)
![languages](https://img.shields.io/badge/languages-1-gray)

*Built with the tools and technologies:*

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)

</div>

-----

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Testing](#testing)
- [Configuration](#configuration)
- [Permissions](#permissions)

-----

## Overview

**Delgun-FiveM** is a lightweight FiveM moderation script that allows authorized staff to instantly delete any targeted vehicle by simply aiming at it. Designed for server admins and moderators who need fast, no-hassle vehicle removal without menus or commands cluttering gameplay.

**Key Features:**

- 🎯 Aim-to-delete vehicle removal system
- 🔐 ACE Permissions-based access control
- ⚙️ Fully configurable range, key binds, and messages
- 🚀 Zero dependencies — drop in and go

-----

## Getting Started

### Prerequisites

- A FiveM server running **FXServer**
- ACE Permissions configured in your `server.cfg`

### Installation

1. Download the latest release from [GitHub](https://github.com/hypercat101/Delgun-FiveM).
1. Extract the `delgun` folder into your server’s `resources` directory.
1. Add the following to your `server.cfg`:

```cfg
start delgun
```

### Usage

Once installed and permissions are granted, aim your weapon at any vehicle and press the configured activation key (default: headlights key) to delete it instantly.

You can also use the command:

```
/delgun
```

### Testing

1. Start your FiveM server with the resource running.
1. Grant yourself the `delgun.use` permission (see [Permissions](#permissions)).
1. Join the server, aim at a vehicle, and press the activation key.
1. The vehicle should disappear with the configured feedback message.

-----

## Configuration

The configuration file is located at `config.lua`.

|Option                   |Description                                       |Default                    |
|-------------------------|--------------------------------------------------|---------------------------|
|`Config.DelgunPermission`|The AcePerms permission required to use the delgun|`delgun.use`               |
|`Config.ActivationKey`   |The key to activate the delgun                    |`170` (INPUT_VEH_HEADLIGHT)|
|`Config.MaxRange`        |The maximum range of the delgun                   |`100.0`                    |
|`Config.Messages`        |The messages displayed to the user                |*(see `config.lua`)*       |

-----

## Permissions

To grant a user or group permission to use the delgun, add the following to your `server.cfg`:

```cfg
add_ace group.admin delgun.use allow
```

This grants the `admin` group access. Replace `group.admin` with any group or identifier you use on your server.

-----

## Project Stats

|Metric     |Value     |
|-----------|----------|
|Language   |Lua 100%  |
|Stars      |⭐ 1       |
|Forks      |🍴 0       |
|Issues     |🐛 0       |
|Last Commit|March 2026|

-----

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request on [GitHub](https://github.com/hypercat101/Delgun-FiveM).

-----

## License

This project is open source. See the repository for details.

-----

<div align="center">
  <sub>Made by <a href="https://github.com/hypercat101">hypercat101</a> · Hypers Development</sub>
</div>