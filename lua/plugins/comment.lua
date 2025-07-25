return {
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("Comment").setup({
				-- add comment for tsx and jsx
				-- https://www.reddit.com/r/neovim/comments/zq3lum/comment/j0xkmdh
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
}
