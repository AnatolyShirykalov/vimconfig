-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- File monitoring
local file_monitor = augroup("FileMonitor", { clear = true })

autocmd("CursorHold", {
  group = file_monitor,
  callback = function()
    vim.cmd("silent! checktime")
  end,
})

autocmd("FocusLost", {
  group = file_monitor,
  callback = function()
    vim.cmd("silent! wa")
  end,
})

-- File type detection
local filetype_detection = augroup("FiletypeDetection", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_detection,
  pattern = "*.thor",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_detection,
  pattern = "*.es6",
  callback = function()
    vim.bo.filetype = "javascript"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_detection,
  pattern = "*.ts",
  callback = function()
    vim.bo.filetype = "typescript"
  end,
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = filetype_detection,
  pattern = "*.handlebars",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

autocmd({ "BufNewFile", "BufRead" }, {
  group = filetype_detection,
  pattern = { "*.tsx", "*.jsx" },
  callback = function()
    vim.bo.filetype = "typescriptreact"
  end,
})

-- File type specific settings
local filetype_settings = augroup("FiletypeSettings", { clear = true })

autocmd("FileType", {
  group = filetype_settings,
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Sign column
autocmd({ "BufRead", "BufNewFile" }, {
  callback = function()
    vim.opt_local.signcolumn = "yes"
  end,
})

-- NERDTree auto-open
local nerdtree_group = augroup("NERDTree", { clear = true })

autocmd("StdinReadPre", {
  group = nerdtree_group,
  callback = function()
    vim.g.std_in = 1
  end,
})

autocmd("VimEnter", {
  group = nerdtree_group,
  callback = function()
    if vim.fn.argc() == 0 and not vim.g.std_in then
      vim.cmd("NERDTree")
    end
  end,
})

-- NERDCommenter Vue support functions
function NERDCommenter_before()
  if vim.bo.filetype == "vue" then
    vim.g.ft = "vue"
    local stack = vim.fn.synstack(vim.fn.line("."), vim.fn.col("."))
    if #stack > 0 then
      local syn = vim.fn.synIDattr(stack[1], "name")
      if syn ~= "" then
        syn = string.lower(syn)
        vim.cmd("setf " .. syn)
      end
    end
  end
end

function NERDCommenter_after()
  if vim.g.ft == "vue" then
    vim.cmd("setf vue")
    vim.g.ft = ""
  end
end

-- Make functions available globally
_G.NERDCommenter_before = NERDCommenter_before
_G.NERDCommenter_after = NERDCommenter_after