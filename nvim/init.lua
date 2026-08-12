vim.o.relativenumber = true
vim.o.number = true
vim.o.breakindent = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.showmode = false
vim.o.expandtab = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.o.mouse = "a"
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.completeopt = "menuone"
vim.o.pumheight = 7
vim.o.foldmethod = "manual"
vim.o.foldenable = false
vim.g.mapleader = " "
vim.o.grepprg = "rg --vimgrep --smart-case --hidden"
vim.o.grepformat = "%f:%l:%c:%m"

vim.pack.add({
  {src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"},
  {src = "https://github.com/christoomey/vim-tmux-navigator"},
  {src = "https://github.com/lewis6991/gitsigns.nvim"},
  {src = "https://github.com/mfussenegger/nvim-jdtls"},
  {src = "https://github.com/neovim/nvim-lspconfig"},
  {src = "https://github.com/windwp/nvim-autopairs"},
  {src = "https://github.com/mason-org/mason.nvim"},
  {src = "https://github.com/vague2k/vague.nvim"},
  {src = "https://github.com/stevearc/oil.nvim"},
  {src = "https://github.com/ibhagwan/fzf-lua"},
  {src = "https://github.com/3rd/image.nvim"},
})

require("vague").setup({ transparent = true })
require("nvim-autopairs").setup()
require("fzf-lua").setup()
require("image").setup({ tmux_show_only_in_active_window = true })
require("mason").setup()
require("oil").setup()
require("nvim-treesitter").install({ "markdown", "python", "javascript",
"java", "c", "cpp" , "sql", "typst"})

vim.lsp.enable({ "jdtls", "lua_ls", "ts_ls", "clangd", "texlab",
"pyright", "postgres_lsp", "tinymist", "arduino-language-server" })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nvim.difftool")

vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>g", ":FzfLua live_grep_native<cr>")
vim.keymap.set("n", "<leader>q", ":FzfLua diagnostics_document<cr>")
vim.keymap.set("n", "<leader>e", ":Oil<cr>")
vim.keymap.set("n", "<leader>u", require("undotree").open)

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<S-g>", "<S-g>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.api.nvim_create_autocmd({ "BufLeave", "VimLeavePre" }, {
	desc = "Update global marks automatically",
	callback = function()
		local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
		local ascii_A = 65
		local ascii_Z = 90
		for i = ascii_A, ascii_Z do
			local mark = string.char(i)
			local row = vim.api.nvim_buf_get_mark(0, mark)[1]
			if row ~= 0 then vim.api.nvim_buf_set_mark(0, mark, lnum, col, {}) end
		end
	end,
})
