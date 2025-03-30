return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"marilari88/neotest-vitest",
			"haydenmeade/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "jest.config.js",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest Test",
			},
			{
				"<leader>tT",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run Current File",
			},
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug Nearest Test",
			},
			{
				"<leader>ts",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop Tests",
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.attach()
				end,
				desc = "Attach to Test",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true })
				end,
				desc = "Open Test Output",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle Output Panel",
			},
			{
				"<leader>tS",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle Summary",
			},
		},
	},
}
