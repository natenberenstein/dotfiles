return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			handlers = {},
		})

		require("nvim-dap-virtual-text").setup()
		dapui.setup()

		-- Auto open/close DAP UI
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- JS/TS launch configurations
		for _, lang in ipairs({ "javascript", "typescript" }) do
			dap.configurations[lang] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
			}
		end

		-- Keymaps
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step in" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step out" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Conditional breakpoint" })
		vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Debug: Toggle REPL" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: Toggle DAP UI" })
	end,
}
