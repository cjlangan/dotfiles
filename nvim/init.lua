vim.o.relativenumber = true
vim.o.breakindent = true
vim.o.swapfile = false
vim.o.showmode = false
vim.o.expandtab = true
vim.o.undofile = true
vim.o.number = true
vim.o.wrap = false
vim.o.clipboard = "unnamedplus"
vim.o.winborder = "rounded"
vim.o.signcolumn = "yes"
vim.o.mouse = "a"
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.scrolloff = 8
vim.o.tabstop = 4
vim.g.mapleader = " "

vim.pack.add({
    {src = "https://github.com/christoomey/vim-tmux-navigator"},
    {src = "https://github.com/lewis6991/gitsigns.nvim"},
    {src = "https://github.com/vague2k/vague.nvim"},
    {src = "https://github.com/neovim/nvim-lspconfig"},
    {src = "https://github.com/mbbill/undotree"},
    {src = "https://github.com/echasnovski/mini.pick"},
    {src = "https://github.com/stevearc/oil.nvim"},
    {src = "https://github.com/windwp/nvim-autopairs"},
    {src = "https://github.com/cbochs/grapple.nvim"},
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})
vim.cmd("set completeopt+=noselect")

require("grapple").setup({ icons = false })
require("nvim-autopairs").setup()
require("mini.pick").setup()
require("oil").setup()

vim.lsp.enable({ "lua_ls", "jdtls", "ts_ls", "clangd", "pyright" })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

vim.keymap.set("n", "<leader>f", ":Pick files<cr>")
vim.keymap.set("n", "<leader>g", ":Pick grep_live<cr>")
vim.keymap.set("n", "<leader>e", ":Oil<cr>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>")
vim.keymap.set("n", "<A-a>", "<cmd>Grapple toggle<cr>")
vim.keymap.set("n", "<A-e>", "<cmd>Grapple toggle_tags<cr>")
vim.keymap.set("n", "<A-j>", "<cmd>Grapple select index=1<cr>")
vim.keymap.set("n", "<A-k>", "<cmd>Grapple select index=2<cr>")
vim.keymap.set("n", "<A-l>", "<cmd>Grapple select index=3<cr>")
vim.keymap.set("n", "<A-;>", "<cmd>Grapple select index=4<cr>")

vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<S-g>", "<S-g>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
