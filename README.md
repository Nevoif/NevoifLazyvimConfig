# lazyvim config - complete guide

yo, this is my neovim setup. it's a full ide for c#/.net, web development, sql, and basically anything modern development throws at you. works great on linux and macos.

## what's in here

**coding stuff**
- roslyn for c# (faster than omnisharp, way lighter)
- vtsls for typescript/javascript with smart hints
- angular language server with component templates
- html, css, tailwind, emmet for web
- lua, python, docker, yaml, bash, powershell

**debugging & testing**
- full dap setup (breakpoints, step through, inspect variables, repl)
- neotest for running unit tests with visual output
- netcoredbg for .net debugging

**building & running**
- easy-dotnet for build/run commands
- kulala rest client (test your apis without postman)
- toggleterm for quick terminal access

**formatting**
- csharpier for c# (strict formatting, i like it)
- prettier for web (typescript, javascript, html, css, json, yaml)
- stylua for lua
- black for python
- htmlhint and hadolint for checking your code

**database & sql**
- dadbod ui for sql queries
- mssql support with env variables
- sql syntax highlighting

**navigation & ui**
- harpoon for jumping between files (lifesaver for context switching)
- aerial for seeing your code structure
- telescope for fuzzy finding everything (now with flash for blazing fast jumps)
- neo-tree file explorer (auto-hides bin/obj folders)
- trouble for seeing all your errors/diagnostics
- rainbow brackets, satellite scrollbar, incline file badges

**visual polish** ✨
- barbecue breadcrumb (delete if its too much) showing your exact code location (file > class > method)
- indent guides with scope highlighting (see nested code structure instantly)
- illuminate auto-highlighting all word matches under cursor
- treesitter context sticky header (never lose track in big files)
- flash jump (press 's' to jump anywhere on screen with 2 chars - feels like vscode)
- smooth scrolling animations (ctrl+u/d feels premium)
- deadcolumn at 120 chars (visual code quality guide, pep8 vibes)
- better floating window styling with rounded borders
- fidget for subtle lsp progress spinner (no annoying notifications)

**git integration** 🚀
- lazygit for full git ui inside neovim (branches, commits, staging - way faster than terminal)
- diffview for side-by-side diffs and file history
- gitsigns with blame showing who changed what and when
- enhanced hunk preview, staging, and inline diffs

**extras**
- auto-closing tags for html/jsx
- incremental rename across your whole project
- code action lightbulb
- todo comment highlighting
- overseer for running tasks
- which-key for discovering keybindings
- luasnip for code snippets
- mini.surround for manipulating quotes/brackets
- persistence for session management (restore buffers)

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

---

## setup

```bash
# clone into your nvim config
git clone https://github.com/Nevoif/NevoifLazyvimConfig.git ~/.config/nvim

# open neovim
nvim

# wait for plugins to install (first time takes a minute)
# then install language servers
:MasonInstall

# you can just press 'I' to install all at once
# or 'i' on each one individually

# restart neovim
:q
nvim
```

that's it. you're ready to code.

---

## keybindings reference

### debugging - `<leader>d`

| key | what it does |
|-----|-------------|
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

### .net build & run

| key | what it does |
|-----|-------------|
| `<leader>B` | build solution (errors in quickfix) |
| `<leader>dr` | run project |
| `<leader>ds` | manage user secrets |

### testing - `<leader>t`

| key | what it does |
|-----|-------------|
| `<leader>tn` | run test at cursor |
| `<leader>ts` | debug test at cursor |
| `<leader>tf` | run all tests in file |
| `<leader>ta` | run all tests in workspace |
| `<leader>to` | toggle test output panel |

### code actions & refactoring

| key | what it does |
|-----|-------------|
| `<leader>cf` | roslyn code actions (fixes, refactors, suggestions) |
| `<leader>cy` | angular: toggle .ts ↔ .html |
| `<leader>rn` | rename symbol everywhere |
| `<leader>ce` | toggle code structure sidebar |

### finding & jumping - `<leader>f` + flash

| key | what it does |
|-----|-------------|
| `<leader>ff` | find files by name |
| `<leader>fg` | search text in project |
| `<leader>fb` | list open buffers |
| `<leader>fh` | search help docs |
| `s` | flash jump (type 2 chars to jump anywhere visible) |
| `S` | flash backward search |

### diagnostics & errors - `<leader>x`

| key | what it does |
|-----|-------------|
| `<leader>xx` | toggle diagnostics |
| `<leader>xw` | workspace diagnostics |
| `<leader>xl` | location list |
| `<leader>xq` | quickfix list |
| `<leader>xt` | show todo comments |

### harpoon (jump between files)

| key | what it does |
|-----|-------------|
| `<leader>ha` | add current file to harpoon |
| `<leader>hh` | show harpoon menu |
| `<leader>1` | jump to harpoon file 1 |
| `<leader>2` | jump to harpoon file 2 |
| `<leader>3` | jump to harpoon file 3 |
| `<leader>4` | jump to harpoon file 4 |

### git - now with lazygit & diffview 🚀

| key | what it does |
|-----|-------------|
| `<leader>gg` | open lazygit (full git ui, for losers) |
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
|-----|-------------|
| `gd` | go to definition |
| `gr` | find all references |
| `gi` | go to implementation |
| `K` | show documentation |

### buffers

| key | what it does |
|-----|-------------|
| `[b` | previous buffer |
| `]b` | next buffer |
| `<C-a>` | select all |

### rest api

| key | what it does |
|-----|-------------|
| `<leader>Rr` | send http request | 
| `<leader>Rt` | toggle headers/body |

### sql

| key | what it does |
|-----|-------------|
| `:DBUI` | open database ui |
| `<leader>sd` | toggle db ui |
| `<leader>r` | run sql query |

### terminal

| key | what it does |
|-----|-------------|
| `<leader>`` | toggle terminal |

### surround - `<leader>m`

| key | what it does |
|-----|-------------|
| `<leader>msa` | add surround (quotes, brackets, etc) |
| `<leader>msd` | delete surround |
| `<leader>msr` | replace surround |
| `<leader>msf` | find surround |
| `<leader>msh` | highlight surround |

### session - `<leader>q`

| key | what it does |
|-----|-------------|
| `<leader>qs` | restore last session |
| `<leader>qS` | select from saved sessions |
| `<leader>ql` | restore last session |

### snippets

| key | what it does |
|-----|-------------|
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
# open database ui
:DBUI

# run your query
<leader>r
```

### testing apis

```bash
# create a .http file (e.g., api.http)
# GET https://localhost:7000/api/users
# Content-Type: application/json

# run it
<leader>Rr (harpoon)

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

### blazing fast navigation (flash)

```bash
# jump to any visible location in 2 keypresses
s              # start flash
xy             # type any 2 visible chars on screen

# backward search
S              # flash backward
```

### see your code structure (aerial)

```bash
# toggle code outline
<leader>ce

# see all classes, methods, properties in a sidebar
# press enter or click to jump there
```

### git workflows (lazygit)

```bash
# open full git ui inside neovim (for losers)
<leader>gg

# in lazygit:
# a - add file to staging
# c - commit
# P - push
# p - pull
# b - switch branches
# d - discard changes
```bash
# toggle code outline
<leader>ce

# see all classes, methods, properties
# click on any of them to jump there
```

---

## file structure

```
~/.config/nvim/
├── init.lua                      # entry point (minimal)
├── lua/
│   ├── config/
│   │   ├── options.lua          # global settings
│   │   ├── keymaps.lua          # all keybindings
│   │   ├── lazy.lua             # plugin setup
│   │   └── autocmds.lua         # auto commands
│   └── plugins/                 # plugin configs (auto-loaded)
│       ├── roslyn.lua           # c# lsp
│       ├── web.lua              # typescript/javascript/html/css
│       ├── angular.lua          # angular specific
│       ├── easy-dotnet.lua      # build/run
│       ├── neotest.lua          # testing
│       ├── csharpdap.lua        # debugging
│       ├── mssql.lua            # mssql connection
│       ├── sql.lua              # dadbod ui
│       ├── mason.lua            # language servers
│       ├── formattingcsharp.lua # formatters
│       ├── ui.lua               # ui stuff
│       ├── harpoon.lua          # file jumping
│       ├── rename.lua           # rename refactoring
│       ├── lightbulb.lua        # code actions
│       ├── api.lua              # rest client
│       ├── todo.lua             # todo comments
│       ├── toggleterm.lua       # terminal
│       ├── trouble.lua          # diagnostics
│       ├── noice.lua            # better messages
│       ├── editor.lua           # neo-tree file explorer
│       └── orcatheme.lua        # theme colors
└── colors/
    └── orcatheme.lua            # color scheme
```

**the important ones:**
- `lua/config/keymaps.lua` - all your shortcuts
- `lua/plugins/roslyn.lua` - c# configuration
- `lua/plugins/easy-dotnet.lua` - build/run setup
- `lua/plugins/web.lua` - typescript/angular/html/css
- `lua/plugins/neotest.lua` - test running

---

## customization

### add a new language

1. edit `lua/plugins/mason.lua` and add the language server to `ensure_installed`
2. create `lua/plugins/<language>.lua` with lsp config
3. restart neovim

### change keybindings

1. edit `lua/config/keymaps.lua`
2. follow the `<leader>X*` pattern so nothing conflicts
3. restart neovim

### project-specific settings

1. create `.nvim.lua` in your project root
2. add your settings there (lazyvim auto-loads it)

### customize the theme

1. edit `colors/orcatheme.lua`
2. restart neovim

---

## troubleshooting

### lsp not starting
```bash
:MasonInstall roslyn
# or whatever language you need
# then try opening a file again
```

### formatter not working
```bash
:MasonInstall prettier
:MasonInstall csharpier
:MasonInstall stylua
```

### tests not running
```bash
# make sure you have [Fact] or [Test] attributes
:MasonInstall neotest-dotnet
```

### debugging not working
```bash
dotnet build
:MasonInstall netcoredbg
# set breakpoint: <leader>db
# start debug: <leader>dc
```

### check startup time
```bash
:StartupTime
```

---

## useful commands

```vim
:MasonInstall         # manage language servers
:MasonUpdate          # update all servers
:Lazy                 # plugin manager
:LspInfo              # see lsp status
:checkhealth          # overall health check
:Telescope keymaps    # view all keybindings
```

---

## language support

| language | lsp | formatter | debugger |
|----------|-----|-----------|----------|
| c# | roslyn | csharpier | netcoredbg ✅ |
| typescript | vtsls | prettier | builtin ✅ |
| javascript | vtsls | prettier | builtin ✅ |
| angular | angularls | prettier | builtin ✅ |
| html | html-lsp | prettier | - ✅ |
| css/scss | cssls | prettier | - ✅ |
| lua | lua-lsp | stylua | - ✅ |
| python | python-lsp | black | - ✅ |
| sql | - | - | dadbod ui ✅ |
| yaml | yaml-lsp | - | - ✅ |
| docker | docker-lsp | - | - ✅ |
| powershell | pwsh-lsp | - | - ✅ |

---


