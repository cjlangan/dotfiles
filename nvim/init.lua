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
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.completeopt = "menuone"
vim.o.pumheight = 7
vim.o.foldmethod = "indent"
vim.o.foldenable = false
vim.g.mapleader = " "

vim.pack.add({
  {src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main"},
  {src = "https://github.com/christoomey/vim-tmux-navigator"},
  {src = "https://github.com/lewis6991/gitsigns.nvim"},
  {src = "https://github.com/neovim/nvim-lspconfig"},
  {src = "https://github.com/windwp/nvim-autopairs"},
  {src = "https://github.com/mfussenegger/nvim-dap"},
  {src = "https://github.com/mason-org/mason.nvim"},
  {src = "https://github.com/vague2k/vague.nvim"},
  {src = "https://github.com/stevearc/oil.nvim"},
  {src = "https://github.com/ibhagwan/fzf-lua"},
  {src = "https://github.com/tpope/vim-dadbod"},
  {src = "https://github.com/mbbill/undotree"},
  {src = "https://github.com/3rd/image.nvim"},
})

require("vague").setup({ transparent = true })
require("nvim-autopairs").setup()
-- require("mini.pick").setup()
require("fzf-lua").setup()
require("mason").setup()
require("oil").setup()
require("image").setup({ tmux_show_only_in_active_window = true })
require("nvim-treesitter").install({ "markdown", "python", "javascript",
"java", "c" , "sql", "typst"})

vim.lsp.enable({ "lua_ls", "jdtls", "ts_ls", "clangd", "texlab",
"pyright" , "postgres_lsp", "tinymist" })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")


vim.keymap.set("n", "<leader>f", ":FzfLua files<cr>")
vim.keymap.set("n", "<leader>g", ":FzfLua live_grep_native<cr>")
vim.keymap.set("n", "<leader>q", ":FzfLua diagnostics_document<cr>")
vim.keymap.set("n", "<leader>e", ":Oil<cr>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>")

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<S-g>", "<S-g>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
