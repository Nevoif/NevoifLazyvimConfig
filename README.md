# 💤 Nevoif's LazyVim Config

This repository contains my personal Neovim configuration using [LazyVim](https://github.com/LazyVim/LazyVim).

It includes my custom setups for:
- Treesitter
- C# / .NET development
- MSSQL integration (with environment variables)
- Keymaps, themes, and formatting

---

## Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim
```

2. **Set environment variables for MSSQL**

For mssql.lua add these lines to your ~/.zshrc (or your shell config):

export MSSQL_USER= 
export MSSQL_PASSWORD= 

reload your shell

source ~/.zshrc  (or your shell config)

3. **Open Neovim:**

- LazyVim will automatically install all required plugins.
- Your custom configuration will be applied automatically.

---

## Notes

- Only configuration files are included; **plugins themselves are not committed**.
- No passwords or secrets are stored in this repository.
- Tested on Linux (Arch) + zsh, should also work on macOS.
- Windows support is untested.
- There is a Arch specific setting inside dotnet.lua plugin i guess? Feel free to modify it for your OS.
- If you want to change the theme, too bad. Play with the settings as you wish but know that theme files are a bit messy.

---

## Recommended

- [Neovim 0.9+](https://neovim.io/) installed
- Git installed (LazyVim pulls plugins automatically)
- Optional utilities for best plugin experience: `fd`, `ripgrep`, `bat`
