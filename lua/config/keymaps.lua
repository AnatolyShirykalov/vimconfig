-- Key mappings
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Save commands
keymap.set("n", "<C-s>", ":wall<cr>", opts)
keymap.set("i", "<C-s>", "<esc>:wall<cr>", opts)

-- Buffer switching
keymap.set("n", "<C-e>", ":e#<CR>", opts)
keymap.set("n", "<space>", "i <Esc>", opts)

-- Home key behavior
keymap.set("n", "<Home>", "^", opts)
keymap.set("i", "<Home>", "<C-O>^", opts)

-- Tab indentation
keymap.set("v", "<Tab>", ":><CR>gv", opts)
keymap.set("v", "<S-Tab>", ":<<CR>gv", opts)
keymap.set("n", "<Tab>", ">>", opts)
keymap.set("n", "<S-Tab>", "<<", opts)
keymap.set("i", "<Tab>", "<c-t>", opts)
keymap.set("i", "<S-Tab>", "<c-d>", opts)
keymap.set("n", "<C-Tab>", "==", opts)

-- Better split navigation
keymap.set("n", "<M-h>", "<C-w>h", opts)
keymap.set("n", "<M-j>", "<C-w>j", opts)
keymap.set("n", "<M-k>", "<C-w>k", opts)
keymap.set("n", "<M-l>", "<C-w>l", opts)

-- Arrow key navigation
keymap.set("", "<M-Right>", "<c-w>l", opts)
keymap.set("", "<M-Left>", "<c-w>h", opts)
keymap.set("", "<M-Up>", "<c-w>k", opts)
keymap.set("", "<M-Down>", "<c-w>j", opts)

keymap.set("i", "<M-Right>", "<ESC><c-w>l", opts)
keymap.set("i", "<M-Left>", "<ESC><c-w>h", opts)
keymap.set("i", "<M-Up>", "<ESC><c-w>k", opts)
keymap.set("i", "<M-Down>", "<ESC><c-w>j", opts)

-- Move lines up/down
keymap.set("n", "<C-Up>", "[e", opts)
keymap.set("n", "<C-Down>", "]e", opts)
keymap.set("v", "<C-Up>", "[egv", opts)
keymap.set("v", "<C-Down>", "]egv", opts)

-- Replace word under cursor
keymap.set("n", "<M-s>", "\"_diwP", opts)
keymap.set("v", "<M-s>", "\"_dP", opts)
keymap.set("n", "<M-a>", "vw\"_dP", opts)

-- Special character mappings (preserving from original)
keymap.set("n", "ó", "\"_diwP", opts)
keymap.set("v", "ó", "\"_dP", opts)
keymap.set("n", "á", "vw\"_dP", opts)

-- Window management
keymap.set("n", "<m-x>", "<C-w>q", opts)
keymap.set("n", "<m-c>", "<C-w>q", opts)
keymap.set("n", "<m-'>", "<C-w>v", opts)
keymap.set("n", "<m-/>", "<C-w>s", opts)

-- Special character window mappings
keymap.set("n", "ø", "<C-w>q", opts)
keymap.set("n", "ã", "<C-w>q", opts)
keymap.set("n", "§", "<C-w>v", opts)
keymap.set("n", "¯", "<C-w>s", opts)

-- Function keys
keymap.set("", "<F2>", "\"_dw", opts)
keymap.set("", "<F3>", "\"_dd", opts)
keymap.set("", "<F4>", "\"_d", opts)
keymap.set("", "<F6>", ":call NERDComment(0, \"invert\")<cr>", opts)
keymap.set("", "<F7>", ":%s/\\r//g<cr>", opts)

-- Remove trailing whitespace
keymap.set("n", "<F10>", ":let _s=@/<Bar>:%s/\\s\\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>", opts)

-- Shift arrow keys
keymap.set("", "<S-Up>", "<Up>", opts)
keymap.set("", "<S-Down>", "<Down>", opts)

-- Better page up/down
keymap.set("", "<PageUp>", "<C-U>", opts)
keymap.set("", "<PageDown>", "<C-D>", opts)
keymap.set("i", "<PageUp>", "<C-O><C-U>", opts)
keymap.set("i", "<PageDown>", "<C-O><C-D>", opts)

-- Leader key mappings
keymap.set("n", "<leader>v", ":e ~/.config/nvim/init.lua<cr>", opts)
keymap.set("n", "<leader>7", ":e ~/.i3/config<cr>", opts)
keymap.set("n", "<leader>z", ":e ~/.zshrc<cr>", opts)
keymap.set("n", "<leader>a", ":e ~/.config/alacritty/alacritty.toml<cr>", opts)

-- File operations
keymap.set("n", "<leader>f", ":let @+=expand('%')<cr>", opts)
keymap.set("n", "<leader>d", ":NERDTreeFind<cr>", opts)
keymap.set("n", "<leader>p", ":let @+='app\\'.join(split(expand('%')[0:-5], '/'), '\\')<cr>", opts)

-- NERDTree
keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>", opts)

-- NERDCommenter
keymap.set("", "<leader>r", ":call NERDComment(0, \"invert\")<cr>", opts)

-- UndoTree
keymap.set("n", "<Leader>u", ":UndotreeToggle<cr>", opts)

-- Miniyank (handled in plugin config)

-- Font size changes
keymap.set("n", "<leader>1", ":Guifont! PragmataPro:h11<cr>", opts)
keymap.set("n", "<leader>2", ":Guifont! PragmataPro:h14<cr>", opts)
keymap.set("n", "<leader>3", ":Guifont! PragmataPro:h18<cr>", opts)
keymap.set("n", "<leader>4", ":Guifont! PragmataPro:h26<cr>", opts)

-- JSON formatting
keymap.set("n", "<leader>j", ":execute '%!jq' | w<cr>", opts)
keymap.set("n", "<leader>m", ":execute '%!jq --compact-output' | w<cr>", opts)

-- FZF
keymap.set("", "<C-k>", ":FZF<CR>", opts)
keymap.set("", "<C-p>", ":GFiles<CR>", opts)

-- Ollama AI mappings
keymap.set("n", "<Leader>ai", ":Ollama<CR>", opts)
keymap.set("v", "<Leader>ai", ":Ollama<CR>", opts)
keymap.set("n", "<Leader>ac", ":OllamaExplain<CR>", opts)
keymap.set("v", "<Leader>ac", ":OllamaExplain<CR>", opts)
keymap.set("n", "<Leader>af", ":OllamaFix<CR>", opts)
keymap.set("v", "<Leader>af", ":OllamaFix<CR>", opts)
keymap.set("n", "<Leader>ar", ":OllamaReview<CR>", opts)
keymap.set("v", "<Leader>ar", ":OllamaReview<CR>", opts)

-- Clipboard paste in command mode
keymap.set("c", "<S-Insert>", "<C-R>+", { noremap = true })

-- Command abbreviations (moved to ack.vim plugin config)

-- Commands
vim.cmd("command! W :w")
vim.cmd("command! Wa :wa")