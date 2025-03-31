return {
	"dgox16/oldworld.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- High priority to ensure it loads first
	config = function(_, opts)
		require("oldworld").setup(opts)
		vim.cmd([[colorscheme oldworld]])
	end,
}
-- -- add dracula
-- { "Mofiqul/dracula.nvim" },
--
-- -- Configure LazyVim to load dracula
-- {
--   "LazyVim/LazyVim",
--   opts = {
--     colorscheme = "dracula",
--   },
-- },
-- "nyngwang/nvimgelion",
-- config = function()
--   vim.cmd("colorscheme nvimgelion")
--   -- do whatever you want for further customization~
-- end,
-- "tiagovla/tokyodark.nvim",
-- opts = {
--   -- custom options here
-- },
-- config = function(_, opts)
--   require("tokyodark").setup(opts) -- calling setup is optional
--   vim.cmd([[colorscheme tokyodark]])
-- end,
