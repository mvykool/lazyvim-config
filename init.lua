-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.notify = function() end
vim.api.nvim_set_keymap("i", "<CR>", "<CR>", { noremap = true, silent = true, expr = false })
vim.opt.completeopt = "menu,menuone,noselect"
vim.g.lazyvim_no_autoformat = true
vim.g.lazyvim_no_lsp = true
-- Add keymaps for debugging
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", function()
	require("dap").continue()
end, { desc = "Continue" })
vim.keymap.set("n", "<leader>di", function()
	require("dap").step_into()
end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", function()
	require("dap").step_over()
end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>dt", function()
	require("dap-go").debug_test()
end, { desc = "Debug Test" })

-- Nuclear option: remap Enter in insert mode at the lowest level possible
vim.keymap.set("i", "<CR>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-e><CR>" -- Close popup and create newline
	end
	return "<CR>"
end, { expr = true, noremap = true, silent = true })
require("config.lazy")

vim.opt.completeopt = "menu,menuone,noselect"
require("conform").setup({
	format_on_save = true,
	formatters_by_ft = {
		typescript = { "prettier" },
		javascript = { "prettier" },

		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
	},
})
require("oil").setup()
require("neo-tree").setup({
	window = {
		position = "right",
	},
})

-- Ensure you're in the correct mode and context for the mappings
local map = vim.api.nvim_set_keymap

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Define the keymap for "jk" to escape to normal mode
map("i", "jk", "<Esc>", { noremap = true, silent = true })
