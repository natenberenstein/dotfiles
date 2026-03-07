return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>f", group = "Find" },
			{ "<leader>s", group = "Search" },
			{ "<leader>g", group = "Git" },
			{ "<leader>h", group = "Hunk" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>t", group = "Test" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>c", group = "Code" },
			{ "<leader>e", group = "Explorer" },
			{ "<leader>r", group = "Rename/Restart" },
			{ "<leader><Tab>", group = "Tabs" },
		},
	},
}
