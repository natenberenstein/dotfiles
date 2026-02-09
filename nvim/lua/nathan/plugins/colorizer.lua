return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = { "*" },
		user_default_options = {
			names = false,
			css = true,
			css_fn = true,
			tailwind = true,
			mode = "background",
		},
	},
}
