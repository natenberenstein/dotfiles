return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		zen = {
			width = 150,
		},
	},
	keys = {
		-- Explorer
		{ "<leader>ee", function() Snacks.explorer() end, desc = "Toggle file explorer" },
		{ "<leader>ef", function() Snacks.explorer.open() end, desc = "Explorer on current file" },

		-- Find files
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep in cwd" },
		{ "<leader>fc", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor", mode = { "n", "x" } },
		{ "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Find todos" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart find files" },

		-- Search
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help pages" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>su", function() Snacks.picker.undo() end, desc = "Undo history" },

		-- Git (picker)
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff" },

		-- LazyGit
		{ "<leader>lg", function() Snacks.lazygit() end, desc = "Open lazygit" },

		-- Zen
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle zen mode" },
	},
}
