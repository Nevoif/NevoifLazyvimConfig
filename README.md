# lazyvim config - complete guide

hello! this is my neovim setup. it's a full ide for c#/.net, web development, python, R/data analysis, sql, and basically whatever i need to use rn or later. works great on linux and windows, i saw people having issues with formattings and stuff on macos so there is that!

## what's in here

**coding stuff**
- roslyn for c# (faster than omnisharp, way lighter)
- clangd for c/c++ (standard systems programming setup)
- jdtls via nvim-java for java (full eclipse-grade support)
- vtsls for typescript/javascript with smart hints
- angular language server with component templates
- html, css, tailwind, emmet for web
- pylsp + pyright for python (full python development)
- r_language_server for R with styler formatting (data science ready)
- lua, docker, yaml, bash, powershell

**debugging & testing**
- full dap setup (breakpoints, step through, inspect variables, repl)
- netcoredbg for .net debugging
- codelldb for c/c++ debugging (fix those segfaults)
- java debug adapter for java applications
- debugpy for python debugging
- dap virtual text (see variable values inline while debugging)
- neotest for running unit tests with visual output (python + .NET support)
- pytest integration for python

**building & running**
- easy-dotnet for build/run commands
- kulala rest client (test your apis without postman)
- toggleterm for quick terminal access
- code_runner for python scripts
- overseer for running tasks

**formatting**
- csharpier for c# (strict formatting, i like it)
- clang-format for c/c++
- black + isort for python
- styler for R (tidyverse style formatting)
- prettier for web (typescript, javascript, html, css, json, yaml)
- stylua for lua
- htmlhint and hadolint for checking your code

**database & sql**
- dadbod ui for sql queries
- easy mssql connection with env variables
- sql syntax highlighting
- visual query results

**navigation & ui**
- harpoon for jumping between files (lifesaver for context switching)
- aerial for seeing your code structure
- telescope for fuzzy finding everything (now with flash for blazing fast jumps)
- neo-tree file explorer (auto-hides bin/obj folders)
- trouble for seeing all your errors/diagnostics
- rainbow brackets, satellite scrollbar, incline file badges

**visual polish**
- barbecue breadcrumb showing your exact code location (file > class > method)
- indent guides with scope highlighting (see nested code structure instantly)
- illuminate auto-highlighting all word matches under cursor
- treesitter context sticky header (never lose track in big files)
- flash jump (press 's' to jump anywhere on screen with 2 chars - feels like vscode)
- smooth scrolling animations (ctrl+u/d feels premium)
- deadcolumn at 120 chars (visual code quality guide, pep8 vibes)
- better floating window styling with rounded borders
- fidget for subtle lsp progress spinner (no annoying notifications)
- improved inlay hints (see types and parameter names inline)

**git integration**
- lazygit for full git ui inside neovim (branches, commits, staging - you should learn console commands tho.)
- diffview for side-by-side diffs and file history
- gitsigns with blame showing who changed what and when
- enhanced hunk preview, staging, and inline diffs

**smart refactoring & code intelligence**
- avante.nvim for ai-powered refactoring
- package-info.nvim for checking outdated dependencies in package.json
- incremental rename across your whole project
- code action lightbulb
- auto-closing tags for html/jsx

**extras**
- todo comment highlighting
- which-key for discovering keybindings
- luasnip for code snippets
- mini.surround for manipulating quotes/brackets
- persistence for session management (restore buffers)
- noice for better messages and notifications

---

## what you need to install first

**neovim + tools**
```bash
# neovim 0.10 or higher
brew install neovim           # macos
sudo pacman -S neovim         # arch

# build essentials
sudo pacman -S base-devel unzip wget ripgrep fd
# or on macos
brew install ripgrep fd

# .net sdk 6.0+
```

**java & c++ essentials**

```bash
# java development kit (required for jdtls)
sudo pacman -S jdk-openjdk    # arch
brew install openjdk          # macos

# c++ compiler
sudo pacman -S gcc            # arch
```

**python setup**
```bash
# python 3.8+ (usually pre-installed)
# pip for installing formatters
pip install black isort
```

**R setup (for data analysis)**
```bash
# install R
brew install r                # macos
sudo pacman -S r              # arch

# in R console, install language server and formatter:
install.packages("languageserver")
install.packages("styler")
```

**global tools**

```bash
# c# formatter (this is needed for formatting to work)
dotnet tool install -g csharpier

# optional but nice
dotnet tool install -g dotnet-ef
dotnet tool install -g dotnet-user-secrets
```

**debugger & lsp**

```bash
# c# debugger
brew install netcoredbg        # macos
yay -S netcoredbg              # arch

# roslyn (c# language server)
# mason will install this automatically

# node.js for web tools
brew install node              # macos
```

**if you're doing sql work**

```bash
# add to ~/.zshrc or ~/.bashrc
export MSSQL_USER="sa"
export MSSQL_PASSWORD="your_password_here"

# then: source ~/.zshrc
```

**database setup - ready to go**

you have two ways to configure databases:

*option 1: local file (recommended for multiple databases)*

create `lua/local/db_connections.lua`:

```lua
return {
  ["PostgreSQL: Dev"] = "postgresql://user:password@localhost:5432/dev_db",
  ["PostgreSQL: Prod"] = "postgresql://user:password@localhost:5432/prod_db",
  ["MySQL: Local"] = "mysql://user:password@localhost:3306/mydb",
  ["MSSQL: Docker"] = "sqlserver://sa:YourPassword@localhost:1433/master",
}
```

then just open neovim and `<leader>Dd` will show all your connections ready to query.

*option 2: environment variables (simple single database)*

```bash
# postgres
export POSTGRES_USER="your_user"
export POSTGRES_PASSWORD="your_password"

# mssql (uses sa account)
export MSSQL_USER="sa"
export MSSQL_PASSWORD="your_password"
```

the plugin will automatically create default connections for these. if you want custom databases, use option 1.

**connection string formats** (for local/db_connections.lua)

```
PostgreSQL: postgresql://user:password@host:5432/database
MySQL:      mysql://user:password@host:3306/database
MSSQL:      sqlserver://user:password@host:1433/database
SQLite:     sqlite:///path/to/file.db
```

---

## setup

```bash
# clone into your nvim config
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim

# open neovim
nvim

# wait for plugins to install (first time takes a minute)
# mason will automatically install language servers

# restart neovim if needed
:q
nvim
```

that's it. you're ready to code.

---

## keybindings reference

### debugging - `<leader>d`

| key | what it does |
| --- | --- |
| `<leader>db` | set/toggle breakpoint |
| `<leader>dc` | continue/start debugging |
| `<leader>do` | step over line |
| `<leader>di` | step into function |
| `<leader>du` | step out of function |
| `<leader>dy` | toggle dap ui (breakpoints, variables, watches) |
| `<leader>dm` | toggle debug console (repl) |
| `<leader>dh` | hover to see variable value |
| `<leader>de` | evaluate expression (select in visual mode) |
| `<leader>dx` | exception breakpoints |
| `<leader>dq` | stop debugging |

**tip**: with dap virtual text enabled, you'll see variable values directly inline as you step through code

### .net build & run

| key | what it does |
| --- | --- |
| `<leader>B` | build solution (errors in quickfix) |
| `<leader>dr` | run project |
| `<leader>ds` | manage user secrets |

### testing - `<leader>t`

| key | what it does |
| --- | --- |
| `<leader>tn` | run test at cursor |
| `<leader>ts` | debug test at cursor |
| `<leader>tf` | run all tests in file |
| `<leader>ta` | run all tests in workspace |
| `<leader>to` | toggle test output panel |

### code actions & refactoring

| key | what it does |
| --- | --- |
| `<leader>cf` | roslyn code actions (fixes, refactors, suggestions) |
| `<leader>cy` | angular: toggle .ts ↔ .html |
| `<leader>rn` | rename symbol everywhere |
| `<leader>ce` | toggle code structure sidebar |

### finding & jumping - `<leader>f` + flash

| key | what it does |
| --- | --- |
| `<leader>ff` | find files by name |
| `<leader>fg` | search text in project |
| `<leader>fb` | list open buffers |
| `<leader>fh` | search help docs |
| `s` | flash jump (type 2 chars to jump anywhere visible) |
| `S` | flash backward search |

### diagnostics & errors - `<leader>x`

| key | what it does |
| --- | --- |
| `<leader>xx` | toggle diagnostics |
| `<leader>xw` | workspace diagnostics |
| `<leader>xl` | location list |
| `<leader>xq` | quickfix list |
| `<leader>xt` | show todo comments |

### harpoon (jump between files)

| key | what it does |
| --- | --- |
| `<leader>ha` | add current file to harpoon |
| `<leader>hh` | show harpoon menu |
| `<leader>1` | jump to harpoon file 1 |
| `<leader>2` | jump to harpoon file 2 |
| `<leader>3` | jump to harpoon file 3 |
| `<leader>4` | jump to harpoon file 4 |

### git - now with lazygit & diffview

| key | what it does |
| --- | --- |
| `<leader>gg` | open lazygit (full git ui) |
| `<leader>gd` | diffview (side-by-side diffs) |
| `<leader>gh` | file history |
| `]h` | next git change |
| `[h` | previous git change |
| `<leader>hs` | stage hunk |
| `<leader>hu` | undo stage hunk |
| `<leader>hr` | reset hunk |
| `<leader>hp` | preview hunk |
| `<leader>hd` | diff this hunk |
| `<leader>hb` | blame line (who changed it & when) |
| `<leader>gs` | git status |

### built-in lsp (works everywhere)

| key | what it does |
| --- | --- |
| `gd` | go to definition |
| `gr` | find all references |
| `gi` | go to implementation |
| `K` | show documentation |

### buffers

| key | what it does |
| --- | --- |
| `[b` | previous buffer |
| `]b` | next buffer |
| `<C-a>` | select all |

### rest api

| key | what it does |
| --- | --- |
| `<leader>Rr` | send http request |
| `<leader>Rt` | toggle headers/body |

### sql

| key | what it does |
| --- | --- |
| `:DBUI` | open database ui |
| `<leader>sd` | toggle db ui |
| `<leader>r` | run sql query |

### terminal

| key | what it does |
| --- | --- |
| `<leader>`` | toggle terminal |

### surround - `<leader>m`

| key | what it does |
| --- | --- |
| `<leader>msa` | add surround (quotes, brackets, etc) |
| `<leader>msd` | delete surround |
| `<leader>msr` | replace surround |
| `<leader>msf` | find surround |
| `<leader>msh` | highlight surround |

### session - `<leader>q`

| key | what it does |
| --- | --- |
| `<leader>qs` | restore last session |
| `<leader>qS` | select from saved sessions |
| `<leader>ql` | restore last session |

### snippets

| key | what it does |
| --- | --- |
| `<C-l>` | expand snippet / jump to next placeholder |
| `<C-h>` | jump to previous placeholder |
| `<C-u>` | cycle through choices |

---

## common workflows

### new c# project

```bash
# create and open
dotnet new webapp -n myapp && cd myapp && nvim

# in neovim:
<leader>B         # build
<leader>dr        # run it
<leader>db        # set breakpoint somewhere
<leader>dc        # start debugging
<leader>do        # step through
# watch variables appear inline thanks to dap virtual text
```

### python development

```bash
# create file
touch script.py && nvim script.py

# in neovim:
# write your code
<leader>db        # set breakpoint
<leader>dc        # start debugging
<leader>tn        # run pytest tests

# formatting happens automatically on save
# black for code, isort for imports
```

### R / data analysis

```bash
# open R script or project
nvim analysis.R

# in neovim:
# write your R code
K              # show function documentation
gd             # go to definition
<leader>cf     # code actions (refactor, extract function)
:w             # save (auto-formats with styler)

# for interactive work:
<leader>`      # toggle terminal
# R             # start R console
# source("analysis.R")
```

**tip for R users**: styler will format your code to tidyverse style guide. if you prefer base R style, you can configure it in `lua/plugins/r.lua`

### c++ / systems programming

```bash
# create file
touch main.cpp && nvim main.cpp

# in neovim:
# write your code
<leader>db        # set breakpoint
<leader>dc        # compile (manual) & launch debugger
<leader>do        # step through
# see variable values inline while debugging
```

### java project

```bash
# open any java project
nvim src/Main.java

# wait for jdtls to attach (coffee cup icon)
<leader>dc        # start debugging automatically
```

### angular development

```bash
cd my-angular-app && nvim

# toggle between typescript and html
<leader>cy

# format code
:FormatWrite

# run tests
<leader>tn

# check for outdated packages
# package-info.nvim shows versions inline in package.json
```

### unit testing

```bash
# run the test at your cursor
<leader>tn

# debug it (step through line by line)
<leader>ts

# run all tests in current file
<leader>tf

# see the output
<leader>to
```

### sql queries

```bash
# set up your connection first (see setup section above)
# open database ui
:DBUI

# navigate to your database
# select your table
# write query
<leader>r        # run it
# results show in a nice table view
```

### testing apis

```bash
# create a .http file (e.g., api.http)
# GET https://localhost:7000/api/users
# Content-Type: application/json

# run it
<leader>Rr

# see response in split window
# toggle between headers and body with <leader>Rt
```

### harpoon workflow

```bash
# mark your most-used files
<leader>ha        # on Program.cs
<leader>ha        # on YourService.cs
<leader>ha        # on DbContext.cs

# then jump between them instantly
<leader>1         # Program.cs
<leader>2         # YourService.cs
<leader>3         # DbContext.cs

# or see all marked files
<leader>hh
```

this is a lifesaver when you're jumping between controllers, services, and models constantly

### blazing fast navigation (flash)

```bash
# jump to any visible location in 2 keypresses
s              # start flash
xy             # type any 2 visible chars on screen

# backward search
S              # flash backward
```

way faster than spamming `w` or `/` searching

### see your code structure (aerial)

```bash
# toggle code outline
<leader>ce

# see all classes, methods, properties in a sidebar
# press enter or click to jump there
```

super useful in large files - see everything at a glance

### git workflows (lazygit)

```bash
# open full git ui inside neovim
<leader>gg

# in lazygit:
# a - add file to staging
# c - commit
# P - push
# p - pull
# b - switch branches
# d - discard changes
# enter - see diff

# or for quick stuff:
<leader>hp       # preview git hunk under cursor
<leader>hs       # stage it
<leader>hb       # see who changed this line
```

---

## file structure

```
~/.config/nvim/
├── init.lua                      # entry point (minimal)
├── lua/
│   ├── config/
│   │   ├── options.lua           # global settings
│   │   ├── keymaps.lua           # all keybindings
│   │   ├── lazy.lua              # plugin setup
│   │   └── autocmds.lua          # auto commands
│   └── plugins/                  # plugin configs (auto-loaded)
│       ├── dap.lua               # core debugging (UI, C#, C++, Python)
│       ├── roslyn.lua            # c# lsp
│       ├── cpp.lua               # c++ lsp (clangd)
│       ├── java.lua              # java lsp (nvim-java)
│       ├── python.lua            # python lsp + debugging
│       ├── r.lua                 # R language server + styler
│       ├── web.lua               # typescript/javascript/html/css
│       ├── angular.lua           # angular specific
│       ├── easy-dotnet.lua       # build/run
│       ├── neotest.lua           # testing (python + .NET)
│       ├── mssql.lua             # mssql connection
│       ├── sql.lua               # dadbod ui
│       ├── mason.lua             # language servers
│       ├── formattingcsharp.lua  # formatters
│       ├── ui.lua                # ui stuff
│       ├── harpoon.lua           # file jumping
│       ├── rename.lua            # rename refactoring
│       ├── lightbulb.lua         # code actions
│       ├── api.lua               # rest client (kulala)
│       ├── todo.lua              # todo comments
│       ├── toggleterm.lua        # terminal
│       ├── trouble.lua           # diagnostics
│       ├── noice.lua             # better messages
│       ├── editor.lua            # neo-tree file explorer
│       └── orcatheme.lua         # theme colors
└── colors/
    └── orcatheme.lua             # color scheme
```

**the important ones:**

* `lua/config/keymaps.lua` - all your shortcuts
* `lua/config/options.lua` - general vim settings
* `lua/plugins/dap.lua` - debugging configuration
* `lua/plugins/roslyn.lua` - c# configuration
* `lua/plugins/python.lua` - python configuration
* `lua/plugins/r.lua` - R configuration
* `lua/plugins/java.lua` - java configuration
* `lua/plugins/easy-dotnet.lua` - build/run setup
* `lua/plugins/web.lua` - typescript/angular/html/css
* `lua/plugins/neotest.lua` - test running

---

## customization

### add a new language

1. edit `lua/plugins/mason.lua` and add the language server to `ensure_installed`
2. create `lua/plugins/<language>.lua` with lsp config
3. restart neovim

example for go:
```lua
-- lua/plugins/go.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "go" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
    },
  },
}
```

### change keybindings

1. edit `lua/config/keymaps.lua`
2. follow the `<leader>X*` pattern so nothing conflicts
3. restart neovim

```lua
-- example: add a keybind for running go tests
vim.keymap.set("n", "<leader>gt", ":!go test ./...<CR>", { desc = "Run Go Tests" })
```

### project-specific settings

1. create `.nvim.lua` in your project root
2. add your settings there (lazyvim auto-loads it)

```lua
-- .nvim.lua in your project
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
```

### customize the theme

1. edit `colors/orcatheme.lua`
2. restart neovim

### disable inlay hints (if they annoy you)

edit `lua/config/options.lua`:
```lua
vim.lsp.inlay_hint.enable(false)
```

---

## troubleshooting

### lsp not starting

```bash
:MasonInstall roslyn
# or whatever language you need
# then try opening a file again

# check lsp status
:LspInfo
```

### formatter not working

```bash
:MasonInstall prettier
:MasonInstall csharpier
:MasonInstall stylua

# check if formatting is enabled
:FormatInfo
```

### python tools not working

```bash
# install python formatters
pip install black isort

# install debugpy
:MasonInstall debugpy

# check python lsp
:LspInfo
```

### R language server not working

```bash
# in R console:
install.packages("languageserver")
install.packages("styler")

# then restart neovim
# check if it's running
:LspInfo
```

### tests not running

```bash
# make sure you have [Fact] or [Test] attributes for .NET
# or pytest markers for python
:MasonInstall neotest-dotnet
:MasonInstall neotest-python

# check neotest status
:Neotest summary
```

### debugging not working

```bash
# for .NET
dotnet build
:MasonInstall netcoredbg

# for python
:MasonInstall debugpy

# set breakpoint: <leader>db
# start debug: <leader>dc

# check dap status
:DapShowLog
```

### inlay hints not showing

```bash
# make sure your lsp supports it
:LspInfo

# toggle inlay hints
:lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
```

### sql connection not working

```bash
# check env variables are set
echo $MSSQL_USER
echo $MSSQL_PASSWORD

# try connecting manually first
:DBUI

# if still failing, check lua/plugins/sql.lua
```

### startup is slow

```bash
# profile startup time
:StartupTime

# check which plugins are slow
:Lazy profile

# consider lazy-loading heavy plugins
```

### check overall health

```bash
:checkhealth
```

---

## useful commands

```vim
:MasonInstall         # manage language servers
:MasonUpdate          # update all servers
:Lazy                 # plugin manager
:Lazy sync            # update all plugins
:LspInfo              # see lsp status
:LspRestart           # restart lsp server
:checkhealth          # overall health check
:Telescope keymaps    # view all keybindings
:FormatInfo           # see formatters for current buffer
:DapShowLog           # see debug adapter logs
:Neotest summary      # see test results
```

---

## language support

| language | lsp | formatter | debugger | notes |
| --- | --- | --- | --- | --- |
| c# | roslyn | csharpier | netcoredbg ✅ | full .net support |
| c/c++ | clangd | clang-format | codelldb ✅ | systems programming ready |
| java | jdtls | - | java-debug ✅ | eclipse-grade support |
| python | pylsp + pyright | black + isort | debugpy ✅ | pytest integration |
| R | r_language_server | styler | - ✅ | tidyverse formatting |
| typescript | vtsls | prettier | builtin ✅ | smart inlay hints |
| javascript | vtsls | prettier | builtin ✅ | same as typescript |
| angular | angularls | prettier | builtin ✅ | component switching |
| html | html-lsp | prettier | - ✅ | auto-closing tags |
| css/scss | cssls | prettier | - ✅ | tailwind support |
| lua | lua-lsp | stylua | - ✅ | neovim api support |
| sql | - | - | dadbod ui ✅ | mssql ready |
| yaml | yaml-lsp | - | - ✅ | |
| docker | docker-lsp | - | - ✅ | dockerfile support |
| powershell | pwsh-lsp | - | - ✅ | |

---

## tips & tricks

**performance**
- first startup is slow (installing plugins), after that it's instant
- harpoon is way faster than telescope for files you use constantly
- flash (`s`) is the fastest way to jump around - learn it

**debugging**
- set conditional breakpoints: `<leader>db` then edit condition in dap ui
- use the repl (`<leader>dm`) to test expressions while paused
- dap virtual text shows variable values inline - super useful

**formatting**
- formatting happens on save for most languages
- if you don't like auto-format, disable it in options.lua
- for R, styler follows tidyverse style by default

**git**
- lazygit (`<leader>gg`) is way faster than cli for complex operations
- use `<leader>hp` to preview changes before staging
- `<leader>hb` shows git blame inline - great for "who wrote this?"

**testing**
- neotest shows results inline with ✅ and ❌
- `<leader>to` for detailed output
- debugging tests (`<leader>ts`) is incredibly powerful

**refactoring**
- avante.nvim can suggest refactorings
- `<leader>cf` shows all available code actions
- `<leader>rn` renames across entire project

**sql**
- set env vars once, connect everywhere
- results show in nice tables
- can save queries as .sql files

**workflow**
- use harpoon for 3-4 main files
- use telescope for everything else
- use flash for quick jumps on screen
- use aerial to navigate large files
