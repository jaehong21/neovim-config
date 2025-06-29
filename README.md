# Neovim Configuration

A comprehensive Neovim configuration for `jaehong21` powered by **lazy.nvim**
package manager, featuring modern LSP integration, extensive plugin ecosystem,
and multi-language development support.

## Package Manager: lazy.nvim

This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim), a
modern plugin manager for Neovim that provides:

- **Lazy Loading**: Plugins are loaded only when needed, improving startup time
- **Automatic Installation**: Missing plugins are automatically installed on
  first run
- **Lockfile Support**: `lazy-lock.json` ensures reproducible plugin versions
- **Performance Monitoring**: Built-in profiling to track plugin load times
- **Simple Configuration**: Each plugin is configured in its own file under
- **Configuration Merging**: `opts` tables are automatically merged when
  importing specs, enabling modular configuration of tools like conform.nvim and
  nvim-lint across multiple files `lua/plugins/`
- **Dependency Management**: Automatic handling of plugin dependencies

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lazy-lock.json          # Plugin version lockfile
├── stylua.toml            # Lua formatting configuration
└── lua/
    ├── config/            # Core configuration
    │   ├── init.lua       # Main config loader
    │   ├── keymaps.lua    # Key mappings
    │   └── options.lua    # Vim options
    ├── lsp/              # Language Server configurations
    │   ├── bash.lua
    │   ├── dockerfile.lua
    │   ├── go.lua
    │   ├── java.lua
    │   ├── json.lua
    │   ├── lua.lua
    │   ├── makefile.lua
    │   ├── markdown.lua
    │   ├── nix.lua
    │   ├── python.lua
    │   ├── rust.lua
    │   ├── terraform.lua
    │   ├── web.lua
    │   └── yaml.lua
    └── plugins/          # Plugin configurations
        ├── aerial.lua         # Code outline viewer
        ├── autopairs.lua      # Auto bracket pairing
        ├── barbar.lua         # Buffer tabline
        ├── blink-cmp.lua      # Completion engine
        ├── colorscheme.lua    # Theme configuration
        ├── comment.lua        # Smart commenting
        ├── conform.lua        # Code formatting
        ├── copilot.lua        # AI code assistance
        ├── dashboard.lua      # Start screen
        ├── explorer.lua       # File explorer
        ├── gitsigns.lua       # Git integrations
        ├── indent.lua         # Indentation guides
        ├── lualine.lua        # Status line
        ├── markdown-preview.lua # Markdown preview
        ├── noice.lua          # UI enhancements
        ├── nvim-lint.lua      # Linting
        ├── nvim-lspconfig.lua # LSP client config
        ├── nvim-treesitter.lua # Syntax highlighting
        ├── nvim-ufo.lua       # Code folding
        ├── oil.lua            # File manager
        ├── picker.lua         # Fuzzy finder
        ├── snacks.lua         # Utilities
        ├── todo-comments.lua  # TODO highlighting
        ├── trouble.lua        # Diagnostics viewer
        └── wakatime.lua       # Time tracking
```

## Features

### Language Server Protocol (LSP)

- **Native Vim LSP**: Uses `vim.lsp` for language server integration
- **LSP installed manually**: Language servers are installed from
  [nixpkgs](https://github.com/NixOS/nixpkgs) manually
- **Multi-language Support**: Dedicated configurations for 15+ languages
- **Auto-completion**: Powered by blink-cmp for fast, intelligent completions
- **Diagnostics**: Real-time error detection and inline hints
- **Code Actions**: Quick fixes and refactoring suggestions

### Supported Languages

- **Go** - Full LSP support with gopls
- **Python** - Enhanced with pylsp/pyright
- **Rust** - Comprehensive rust-analyzer integration
- **JavaScript/TypeScript** - Modern web development tools
- **Java** - Enterprise development support
- **Lua** - Neovim configuration development
- **Bash/Shell** - Script development tools
- **Docker** - Dockerfile support
- **Terraform** - Infrastructure as code
- **Nix** - Package management
- **Markdown** - Documentation writing
- **JSON/YAML** - Configuration files
- **Makefile** - Build automation

### Development Tools

- **Code Formatting**: Conform.nvim with format-on-save
- **Linting**: nvim-lint for additional code quality checks
- **Git Integration**: Built-in git commands and UI
- **File Management**: Multiple file explorers (snacks explorer, oil)
- **Fuzzy Finding**: Fast file and content search
- **Debugging**: Multi-language debug support
- **AI Assistance**: GitHub Copilot integration

### User Interface

- **Modern UI**: Enhanced with noice.nvim and snacks.nvim
- **Status Line**: Informative lualine configuration
- **Buffer Management**: Barbar for tab-like buffer navigation
- **Code Outline**: Aerial for symbol navigation
- **Folding**: UFO for improved code folding
- **Indentation**: Visual guides for code structure

## Installation

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this configuration**:
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Wait for installation**: lazy.nvim will automatically install all plugins
   on first run

## Key Features

- **Fast Startup**: Lazy loading ensures quick Neovim startup times
- **Consistent Formatting**: Stylua and conform.nvim maintain code quality
- **Productive Workflow**: Carefully chosen keymaps and integrations
- **Extensible**: Modular plugin structure for easy customization
- **Modern Tooling**: Latest Neovim features and plugin ecosystem
- **Multi-language**: Comprehensive support for diverse development needs

This configuration aims to provide a comfortable and productive development
environment with modern tooling and extensive language support, all managed
efficiently through lazy.nvim's powerful plugin management system.
