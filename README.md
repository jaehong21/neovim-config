# jaehong21's Neovim Configuration

A comprehensive Neovim setup focused on providing a comfortable and productive development environment with modern tooling and multi-language support.

**Path:** `~/.config/nvim`

## Plugin Overview

This configuration includes **70+ plugins** organized into the following categories:

### 🤖 AI & Code Assistance

- **GitHub Copilot** - AI-powered code completion
- **Claude Code** - Claude AI integration (disabled)
- **Avante** - Multi-provider AI assistant (disabled)

### 🎨 User Interface & Themes

- **Alpha** - Customizable dashboard with ASCII art
- **Lualine** - Modern status line
- **Color Schemes:** Gruvbox, Kanagawa (active), Tokyo Night, Catppuccin
- **Noice** - Enhanced UI for messages and popups
- **Indent Blankline** - Visual indentation guides

### 📁 File Management & Navigation

- **Neo-tree** - Modern file explorer
- **Oil** - Buffer-based file manager
- **Telescope** - Fuzzy finder for everything
- **Harpoon v2** - Quick file navigation

### 📝 Editing & Text Manipulation

- **Flash** - Enhanced navigation and jumping
- **Comment** - Smart commenting with treesitter
- **Mini.pairs** - Auto-pairing brackets and quotes
- **Inc-rename** - Live LSP renaming

### 🔤 Completion & Snippets

- **Blink.cmp** - Fast completion engine
- **Friendly Snippets** - Comprehensive snippet collection

### 🛠️ LSP & Language Support

**Supported Languages (15+):**

- **Go** - gopls, golangci-lint, gofumpt
- **Python** - pylsp/pyright, black, ruff, venv-selector
- **Rust** - rust_analyzer, rustaceanvim, crates.nvim
- **JavaScript/TypeScript** - ts_ls, eslint, prettier
- **Java** - nvim-jdtls with debugging
- **Lua** - lua_ls, lazydev for Neovim development
- **Web** - HTML, CSS, Tailwind with auto-tag support
- **Zig** - zls, zig_fmt
- **Nix** - nil_ls, nixpkgs-fmt
- **YAML** - yamlls with schema support
- **Terraform** - terraformls, tflint, tfsec
- **Markdown** - markdownlint, live preview
- **Docker** - compose and dockerfile support

### 🔧 Code Formatting & Linting

- **Conform** - Universal formatter with format-on-save
- **Nvim-lint** - Asynchronous linting engine

### 🌳 Syntax & Structure

- **Treesitter** - Modern syntax highlighting and parsing
- **Aerial** - Code outline window
- **UFO** - Advanced folding with treesitter

### 📊 Git Integration

- **Fugitive** - Comprehensive Git wrapper
- **Git Blame** - Inline blame annotations
- **Gitsigns** - Git changes in gutter

### 🖥️ Terminal & External Tools

- **Toggleterm** - Floating terminal management
- **Lazygit** integration

### 🐛 Diagnostics & Debugging

- **Trouble** - Pretty diagnostics viewer
- **DAP** - Debug Adapter Protocol support
- **TODO Comments** - Highlight and search TODO items

### ⚡ Productivity

- **Which-key** - Keybinding discovery and management
- **Wakatime** - Coding time tracking
- **Barbar** - Enhanced buffer/tab management

## Key Features

- **Mason Integration** - Automatic LSP server and tool management
- **Format on Save** - Automatic code formatting
- **Live Diagnostics** - Real-time error detection and fixing
- **Multi-language Debugging** - DAP support for Python and Java
- **Virtual Environment Support** - Python venv selection
- **Package Management** - Cargo.toml dependency management for Rust
- **Schema Validation** - YAML schema support for various formats
- **Modern UI** - Clean, customizable interface with multiple themes
