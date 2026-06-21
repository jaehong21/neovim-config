-- return {
-- 	"echasnovski/mini.pairs",
-- 	event = "VeryLazy",
-- 	opts = {
-- 		modes = { insert = true, command = true, terminal = false },
-- 		skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
-- 		skip_ts = { "string" },
-- 		skip_unbalanced = true,
-- 		markdown = true,
-- 	},
-- }
return {
	"saghen/blink.pairs",
	version = "*",
	dependencies = "saghen/blink.lib",
	build = function() require("blink.pairs").download():pwait(60000) end,
	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {
		highlights = {
			enabled = false,
		},
	},
}
