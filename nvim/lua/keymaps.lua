vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Move chunks of text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center cursor when jump to bottom
vim.keymap.set("n", "<S-g>", "<S-g>zz")

-- Center when searching text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigate Diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- img-clip paste 
vim.keymap.set("n", "<leader>p", "<cmd>PasteImage<cr>")


-- SLLM Bindings
local sllm = require("sllm")

vim.keymap.set({ "n", "v" }, "<leader>ls", function() sllm.ask_llm() end, { desc = "Prompt the LLM with an input box" })
vim.keymap.set({ "n", "v" }, "<leader>ln", function() sllm.new_chat() end, { desc = "Start a new chat (clears buffer)" })
vim.keymap.set({ "n", "v" }, "<leader>lc", function() sllm.cancel() end, { desc = "Cancel current request" })
vim.keymap.set({ "n", "v" }, "<leader>lf", function() sllm.focus_llm_buffer() end, { desc = "Focus the LLM output buffer" })
vim.keymap.set({ "n", "v" }, "<leader>lt", function() sllm.toggle_llm_buffer() end, { desc = "Toggle LLM buffer visibility" })
vim.keymap.set({ "n", "v" }, "<leader>lm", function() sllm.select_model() end, { desc = "Pick a different LLM model" })
vim.keymap.set({ "n", "v" }, "<leader>la", function() sllm.add_file_to_ctx() end, { desc = "Add current file to context" })
vim.keymap.set({ "n", "v" }, "<leader>lu", function() sllm.add_url_to_ctx() end, { desc = "Add content of a URL to context" })
vim.keymap.set("v", "<leader>lv", function() sllm.add_sel_to_ctx() end, { desc = "Add visual selection to context" })
vim.keymap.set({ "n", "v" }, "<leader>ld", function() sllm.add_diag_to_ctx() end, { desc = "Add diagnostics to context" })
vim.keymap.set({ "n", "v" }, "<leader>lx", function() sllm.add_cmd_out_to_ctx() end, { desc = "Add shell command output to context" })
vim.keymap.set({ "n", "v" }, "<leader>lr", function() sllm.reset_context() end, { desc = "Reset/clear all context files" })


-- Harpoon Bindings
local harpoon = require("harpoon")

vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end)
vim.keymap.set("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-;>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-S-N>", function() harpoon:list():next() end)

-- Telescope
-- See `:help telescope.builtin`

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "[S]earch by [G]rep" })

vim.keymap.set("n", "<leader>sc", function() builtin.colorscheme({ enable_preview = true })
end, { desc = "[S]earch [C]colors" })
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<C-s>", function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
  builtin.live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- Undo Tree toggle 
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true,
    silent = true, desc = "Toggle undotree" })

