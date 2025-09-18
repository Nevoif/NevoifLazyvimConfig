# 💤 Nevoif's LazyVim Config

This repository contains my personal Neovim configuration using [LazyVim](https://github.com/LazyVim/LazyVim).

It includes my custom setups for:

* Treesitter
* C# / .NET development
* MSSQL integration (with environment variables)
* Keymaps, themes, and formatting

---

## Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim
```

2. **Install SQL Server tools (if not installed)**

* **Windows:** Use SQL Server Management Studio (SSMS) or `sqlcmd` to connect to your server.
  Run the following SQL commands:

```sql
-- create login
CREATE LOGIN myuser WITH PASSWORD = 'mypassword';

-- create database user for that login
USE mvcone_database;
CREATE USER myuser FOR LOGIN myuser;
ALTER ROLE db_owner ADD MEMBER myuser;
```

* **Linux:** Install `mssql-tools` and `unixodbc`:

```bash
sudo apt update
sudo apt install mssql-tools unixodbc 
```
or

```bash
sudo pacman -S mssql-tools unixodbc 
```

Then connect to your SQL Server:

```bash
sqlcmd -S localhost -U sa -P 'your_sa_password'
```

And run the same SQL commands as above to create a login and database user.

3. **Set environment variables for MSSQL**

Add these lines to your `~/.zshrc` (or shell config):

```bash
export MSSQL_USER=myuser
export MSSQL_PASSWORD=mypassword
```

Reload your shell:

```bash
source ~/.zshrc
```

4. **Open Neovim**

* LazyVim will automatically install all required plugins.
* Your custom configuration will be applied automatically.

---

## Notes

* Only configuration files are included; **plugin source code is not committed**.
* No passwords or secrets are stored in this repository.
* Tested on Linux (Arch) + zsh, should also work on macOS.

---

## Recommended

* [Neovim 0.9+](https://neovim.io/) installed
* Git installed (LazyVim pulls plugins automatically)
* Optional utilities for best plugin experience: `fd`, `ripgrep`, `bat`
