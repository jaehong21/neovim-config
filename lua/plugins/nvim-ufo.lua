return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	opts = {
		provider_selector = function() return { "treesitter", "indent" } end,
	},
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	-- keys = {
	-- 	{ "zR", require("ufo").openAllFolds },
	-- 	{ "zM", require("ufo").closeAllFolds },
	-- },
}
