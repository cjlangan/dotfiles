require "nvchad.options"

-- add yours here!

vim.o.whichwrap = "b,s"
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.opt.tabstop = 4               -- Number of spaces a tab counts for
vim.opt.softtabstop = 4           -- Number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 4            -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true           -- Use spaces instead of tabs

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
