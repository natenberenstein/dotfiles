return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		vim.diagnostic.config({ virtual_text = true })
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
		})
	end,
}
