# 💤 Nevoif's Lazyvim Config

> my highly experimental dotnet development environment.

ditch rider or vs. this is a full dotnet ide for linux (only tested on arch) and macos. handles solutions, roslyn lsp, debugging, testing, sql, and http requests.

currently no issues on my archlinux pcs if all dotnet versions are up to date, netcoredbg and roslyn is installed.

## ⚡ features

  - **core:** roslyn integration via `roslyn.nvim`. supports razor/blazor, inlay hints, fast file watching.
  - **build/run:** `easy-dotnet` for managing sln, csproj, and nugets.
  - **debug:** native debugging with `nvim-dap` + `netcoredbg`.
  - **test:** visual unit testing with `neotest`.
  - **format:** strict formatting with `csharpier`.
  - **http:** run `.http` files natively with `kulala.nvim` (postman replacement).
  - **sql:** native sql client via `vim-dadbod-ui`.
  - **clean:** auto-hides `bin` and `obj` folders.

-----

## 🛠️ requirements
  
  - **loving parents** (mine love me):
  - **neovim 0.10+** (needed for roslyn).
  - **dotnet sdk** (as long as 6 or above ig). 
  - **csharpier** (must install globally):
  
<!-- end list -->

```bash
dotnet tool install -g csharpier
```

  - **dependencies** (arch linux):

<!-- end list -->

```bash
sudo pacman -S base-devel unzip wget ripgrep fd
```

-----

## 🚀 setup

  - **clone repo:**

<!-- end list -->

```bash
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim
```
  - **im also using yay btw in my experience installing these beforehand really helped**
  
  ```bash
yay -S roslyn-ls netcoredbg
```

  - **env vars (sql):** add these to `~/.zshrc` or `~/.bashrc` to auto-connect.

<!-- end list -->

```bash
export MSSQL_USER="your_sa_user"
export MSSQL_PASSWORD="your_strong_password"
```

  - **reload shell:** `source ~/.zshrc`
  - **first launch:** open nvim, let lazy install plugins.
  - **install tools:** run this inside nvim to get binaries.

<!-- end list -->

```vim
:MasonInstall roslyn netcoredbg
```

-----

## ⌨️ keymaps

  - `<leader>B`: **build** solution (quickfix list).
  - `<leader>dr`: **run** project.
  - `<leader>ds`: manage **user secrets**.
  - `<leader>cf`: **code fix** / refactor.
  - `<leader>db`: toggle **breakpoint**.
  - `<leader>dc`: **continue** / start debug (f5).
  - `<leader>t`: **test** menu.
  - `<leader>Rr`: **run http** request.
  - `<leader>Rt`: toggle http response/headers.

-----

## ⚙️ notes

  - **arch linux fix:** `easy-dotnet` config has a (i guess) hardcoded command (`dotnet-easydotnet`) for arch. delete that line in `lua/plugins/easy-dotnet.lua` if you're on macos. if it doesn't cause a problem don't touch lol idk what im doing.
  - **database:** run `:DBUIToggle`. uses the env vars set above.
  - **formatting:** handled by `conform.nvim`. fails if you didn't install `csharpier` globally.
  - **theme:** highly customized messy and drums* autoloads.
  - **secrets:** no passwords in repo. use env vars.
  - **plugins:** not committed. they install on first load.

-----

## 📂 structure

  - `lua/config/`: core options, keys.
  - `lua/plugins/roslyn.lua`: lsp.
  - `lua/plugins/easy-dotnet.lua`: build/run.
  - `lua/plugins/dap.lua`: debug.
  - `lua/plugins/test.lua`: testing.
  - `lua/plugins/sql.lua`: database.
  - `lua/plugins/api.lua`: http client.
