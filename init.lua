-- Modern Neovim configuration in Lua
-- Migrated from init.vim

-- Bootstrap lazy.nvim and load plugins first
require("config.plugins")

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Create necessary directories for backups/undo
local function ensure_dir(path)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

ensure_dir(vim.fn.expand("~/.nvim/tmp/undo"))
ensure_dir(vim.fn.expand("~/.nvim/tmp/backup"))
ensure_dir(vim.fn.expand("~/.nvim/tmp/swap"))