return {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		local ufo = require("ufo")
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
		for _, ls in ipairs(language_servers) do
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
				-- you can add other fields for setting up lsp server in this table
			})
		end

		ufo.setup({
			provider_selector = function()
				return { "lsp", "indent" }
			end,
		})

		vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
		vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Open folds by level" })
		vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Close folds by level" })
		vim.keymap.set("n", "zK", function()
			ufo.peekFoldedLinesUnderCursor()
		end, { desc = "Peek fold" })
	end,
}
