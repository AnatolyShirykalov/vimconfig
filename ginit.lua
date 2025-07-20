-- GUI-specific configuration for nvim-qt
-- Migrated from ginit.vim

-- Enable shift+insert for clipboard paste in command mode
vim.keymap.set("!", "<S-Insert>", "<C-R>+", { noremap = true })