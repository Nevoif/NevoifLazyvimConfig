# 💤 Nevoif's Lazyvim Config

<!--toc:start-->

- [💤 Nevoif's Lazyvim Config](#💤-nevoifs-lazyvim-config)
  - [features](#features)
  - [requirements](#requirements)
  - [setup](#setup)
  - [keymaps](#keymaps)
  - [notes](#notes)
  - [structure](#structure)

<!--toc:end-->

my highly experimental dotnet development environment.

ditch rider or vs. this is a full dotnet ide for linux (only tested on arch)
and macos (no issues on mac so far other than mac having problems with color themes).
handles solutions, roslyn lsp, debugging, testing, sql, and http requests.

currently no issues on my archlinux pcs if all dotnet versions are
up to date, netcoredbg and roslyn is installed.

## features

- **core:** roslyn integration via `roslyn.nvim`.

  supports razor/blazor, inlay hints, fast file watching.

- **build/run:** `easy-dotnet` for managing sln, csproj, and nugets.
- **debug:** native debugging with `nvim-dap` + `netcoredbg`.
- **test:** visual unit testing with `neotest`.
- **format:** strict formatting with `csharpier`.
- **http:** run `.http` files natively with `kulala.nvim` (postman replacement).
- **sql:** native sql client via `vim-dadbod-ui`.
- **clean:** auto-hides `bin` and `obj` folders.
- **tactical nav:**

`harpoon` for rapid context switching

`aerial` for code structure scanning.

- **visuals:** `satellite` (hud scrollbar),

`incline` (floating badges),

`twilight` (focus mode),

`rainbow-delimiters` (code structure colors).

- **multicursor:** full vs-code style multiple cursors via `vim-visual-multi`.

---

## requirements

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

---

## setup

- **clone repo:**

<!-- end list -->

```bash
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim
```

- **im also using yay btw in my experience installing these beforehand really helped**

<!-- end list -->

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

---

## keymaps

**build & run**

- `<leader>dr`: run project (select console/web). (might not work if easy-dotnet not properly set-up)
- `<leader>B`: build solution (errors in quickfix).
- `<leader>ds`: manage user secrets.

**debug (dap)**

- `<leader>dy`: toggle dapUI.
- `<leader>db`: toggle breakpoint.
- `<leader>dc`: start / continue debug (f5).
- `<leader>do`: step over (f10).
- `<leader>di`: step into (f11).
- `<leader>du`: step out (f12).
- `<leader>dO`: open debug console/repl.
- `<leader>dt`: terminate session.

**testing**

- `<leader>tn`: run nearest test (fact/theory).
- `<leader>ts`: debug nearest test.
- `<leader>tf`: run all tests in file.
- `<leader>to`: toggle output panel.
- `<leader>tS`: stop running test.

**navigation (tactical)**

- `<leader>ha`: harpoon add file.
- `<leader>hh`: harpoon menu.
- `<leader>1-4`: jump to harpoon file 1-4.
- `<leader>ce`: toggle code structure sidebar (aerial).
- `s`: flash jump (laser move anywhere).

**lsp & editing**

- `gd`: go to definition.
- `gr`: find references.
- `K`: hover documentation.
- `<leader>ca`: code action (quick fix).
- `<leader>cr`: rename highlighted element across the files.
- `<leader>rn`: rename the element live across the files.
- `Ctrl + n`: add multicursor (find under).
- `<leader>uh`: toggle inlay hints (ghost text).

**http client**

- `<leader>Rr`: run request.
- `<leader>Rt`: toggle view (body/headers).
- `]`: next request.
- `[`: prev request.

**database**

- `<leader>D`: open database drawer.
- `<leader>S`: execute selected query.

**workflow**

- `Ctrl + a`: select all.
- `[b / ]b`: cycle buffers (tabs).

---

## notes

- **database:** run `:DBUIToggle`/`<leader>D`. uses the env vars set above.
- **formatting:** handled by `conform.nvim`. fails if you didn't install `csharpier` globally.
- **theme:** highly customized messy and drums\* autoloads.
- **secrets:** no passwords in repo. use env vars.
- **commands:** there are easy dotnet comments starting with `:Dotnet` which makes adding files or such easier.
- **plugins:** not committed. they install on first load.

---

## structure

- `lua/config/`: core options, keys.
- `lua/plugins/roslyn.lua`: lsp.
- `lua/plugins/easy-dotnet.lua`: build/run.
- `lua/plugins/dap.lua`: debug.
- `lua/plugins/test.lua`: testing.
- `lua/plugins/sql.lua`: database.
- `lua/plugins/api.lua`: http client.
- `lua/plugins/ui.lua`: visuals (satellite, incline, tint, rainbow).
- `lua/plugins/editor.lua`: nav (aerial, harpoon, flash).
