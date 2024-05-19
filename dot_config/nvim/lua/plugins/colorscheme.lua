return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = true,
		integrations = {},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		local time = os.date("*t")
		if time.hour < 8 or time.hour > 18 then
			vim.cmd([[colorscheme catppuccin-macchiato]])
		else
			vim.cmd([[colorscheme catppuccin-macchiato]])
		end
		-- vim.cmd [[colorscheme default]]
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
