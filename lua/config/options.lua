-- Basic Neovim settings
local opt = vim.opt

-- File and buffer management
opt.autoread = true
opt.updatetime = 500

-- Search settings
opt.incsearch = true
opt.hlsearch = true
opt.smartcase = true
opt.ignorecase = true

-- Editing behavior
opt.virtualedit = "onemore"
opt.backspace = { "indent", "eol", "start" }
opt.timeout = true
opt.timeoutlen = 150
opt.ttimeoutlen = 50
opt.showcmd = true

-- UI settings
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.signcolumn = "yes"
opt.number = true
opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

-- Folding
opt.foldmethod = "syntax"
opt.foldlevelstart = 100

-- Indentation
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- Backup and undo settings
opt.undodir = vim.fn.expand("~/.nvim/tmp/undo/")
opt.undofile = true
opt.undolevels = 3000
opt.undoreload = 10000
opt.backupdir = vim.fn.expand("~/.nvim/tmp/backup/")
opt.directory = vim.fn.expand("~/.nvim/tmp/swap/")
opt.backup = true
opt.swapfile = false

-- Disable compatibility
opt.compatible = false

-- Note: Runtime path additions for Dein removed since we're using lazy.nvim

-- Enable filetype detection
vim.cmd("filetype plugin indent on")

-- Syntax highlighting
vim.cmd("syntax on")

-- Set colorscheme
vim.cmd("color Tomorrow-Night")

-- Global variables
vim.g.mapleader = "\\"
vim.g.rails_no_abbreviations = 1
vim.g.go_fmt_command = "goimports"
vim.g.go_info_mode = "guru"

-- Airline settings
vim.g.airline_powerline_fonts = 1
if not vim.g.airline_symbols then
  vim.g.airline_symbols = {}
end
vim.g.airline_symbols.whitespace = "!"

-- Ack/Ag settings
vim.g.ackprg = "ag --vimgrep --smart-case"

-- NERDCommenter Vue support
vim.g.ft = ""

-- Ollama configuration
vim.g.ollama_host = "http://localhost:11435"
vim.g.ollama_model = "devstral"

-- Title function - make it globally accessible
function DirTitle()
  vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  vim.opt.title = true
end

-- Make DirTitle available globally for Vimscript compatibility
_G.DirTitle = DirTitle

-- Create a Vimscript function wrapper
vim.cmd([[
function! DirTitle()
  lua DirTitle()
endfunction
]])

-- Also create a Vim command for it
vim.api.nvim_create_user_command("DirTitle", function()
  DirTitle()
end, {})