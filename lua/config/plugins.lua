-- Plugin configuration using lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  -- Autocompletion
  {
    "Shougo/deoplete.nvim",
    dependencies = {
      "roxma/nvim-yarp",
      "roxma/vim-hug-neovim-rpc",
    },
    config = function()
      vim.g["deoplete#enable_at_startup"] = 1
    end,
  },

  -- Syntax highlighting and language support
  "digitaltoad/vim-pug",
  "slim-template/vim-slim",
  "kchmck/vim-coffee-script",
  "peitalin/vim-jsx-typescript",
  "pangloss/vim-javascript",
  "mxw/vim-jsx",
  "leafgarland/typescript-vim",
  "elixir-editors/vim-elixir",
  "vim-ruby/vim-ruby",
  "fatih/vim-go",

  -- Color schemes
  "javiorfo/nvim-soil",
  "javiorfo/nvim-nyctophilia",
  "nonsense/tomorrow-night-vim-theme",
  "glebtv/onehalf",

  -- Search and file management
  {
    "mileszs/ack.vim",
    cmd = "Ack",
    config = function()
      vim.g.ackprg = "ag --vimgrep --smart-case"
      -- Command abbreviations for Ack
      vim.cmd("cnoreabbrev ag Ack")
      vim.cmd("cnoreabbrev aG Ack")
      vim.cmd("cnoreabbrev Ag Ack")
      vim.cmd("cnoreabbrev AG Ack")
    end,
  },
  "nelstrom/vim-visual-star-search",

  -- Fuzzy finder
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },

  -- File tree
  {
    "preservim/nerdtree",
    dependencies = { "Xuyuanp/nerdtree-git-plugin" },
  },

  -- Comments
  {
    "preservim/nerdcommenter",
    config = function()
      vim.g.NERDCustomDelimiters = {
        javascript = { left = "//", right = "", leftAlt = "{/*", rightAlt = "*/}" },
      }
    end,
  },

  -- Text alignment
  "junegunn/vim-easy-align",

  -- Statusline
  {
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" },
    config = function()
      vim.g.airline_powerline_fonts = 1
      if not vim.g.airline_symbols then
        vim.g.airline_symbols = {}
      end
      vim.g.airline_symbols.whitespace = "!"
    end,
  },

  -- Git integration
  "tpope/vim-fugitive",

  -- Text editing enhancements
  "tpope/vim-endwise",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "Raimondi/delimitMate",
  "terryma/vim-multiple-cursors",

  -- Rails support
  {
    "tpope/vim-rails",
    config = function()
      vim.g.rails_no_abbreviations = 1
    end,
  },

  -- Node.js support
  "moll/vim-node",

  -- Start screen
  "mhinz/vim-startify",

  -- Yank history
  {
    "bfredl/nvim-miniyank",
    config = function()
      -- Note: Denite is not included, using basic miniyank functionality
      -- You may want to add a telescope or fzf integration for miniyank
      vim.api.nvim_set_keymap("n", "<Leader>y", ":call miniyank#drop()<CR>", { noremap = true, silent = true })
    end,
  },

  -- Undo tree
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<cr>", { noremap = true, silent = true })
    end,
  },

  -- Whitespace management
  "bronson/vim-trailing-whitespace",

  -- Indentation guides
  "nathanaelkane/vim-indent-guides",

  -- Go development
  {
    "fatih/vim-go",
    config = function()
      vim.g.go_fmt_command = "goimports"
      vim.g.go_info_mode = "guru"
    end,
  },

  -- AI Integration
  {
    "github/copilot.vim",
    config = function()
      -- Copilot configuration can be added here if needed
    end,
  },

  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("ollama").setup({
        url = "http://localhost:11435",
        model = "devstral",
      })
    end,
  },
}, {
  -- Lazy.nvim configuration
  install = {
    colorscheme = { "Tomorrow-Night" },
  },
  checker = {
    enabled = true,
    notify = false,  -- Disable update notifications
    frequency = 3600,  -- Check for updates every hour instead of startup
  },
})