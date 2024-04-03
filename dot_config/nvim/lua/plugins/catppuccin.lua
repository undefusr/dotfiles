return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		transparent_background = false,
		integrations = {},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		local time = os.date("*t")
		if time.hour < 8 or time.hour > 18 then
			vim.cmd([[colorscheme catppuccin-frappe]])
		else
			vim.cmd([[colorscheme catppuccin-latte]])
		end
	end,
}
