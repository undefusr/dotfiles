return {
	-- Git related plugins
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-sleuth" },
	{ "inkarkat/vim-ReplaceWithRegister" },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{ "nvimdev/hlsearch.nvim",  event = "BufRead", config = {} },
	{ "m4xshen/autoclose.nvim", config = {} },
	{
		"abecodes/tabout.nvim",
		dependencies = { "hrsh7th/nvim-cmp", "nvim-treesitter/nvim-treesitter" },
		config = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			padding = true,
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"famiu/bufdelete.nvim",
		event = { "BufEnter", "BufReadPre", "BufNewFile" },
	},
}
