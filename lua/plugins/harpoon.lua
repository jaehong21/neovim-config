return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local harpoon = require("harpoon")

		vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[H]arpooon [A]dd" })
		vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {
			desc = "[H]arpoon [L]ist",
		})

		-- https://github.com/folke/snacks.nvim/discussions/1058#discussioncomment-12209209
		--[[ local function generate_harpoon_picker()
			local file_paths = {}
			for _, item in ipairs(harpoon:list().items) do
				table.insert(file_paths, {
					text = item.value,
					file = item.value,
				})
			end
			return file_paths
		end

		vim.keymap.set("n", "<leader>hl", function()
			Snacks.picker({
				finder = generate_harpoon_picker,
				win = {
					input = {
						keys = {
							["dd"] = { "harpoon_delete", mode = { "n", "x" } },
						},
					},
					list = {
						keys = {
							["dd"] = { "harpoon_delete", mode = { "n", "x" } },
						},
					},
				},
				actions = {
					harpoon_delete = function(picker, item)
						local to_remove = item or picker:selected()
						table.remove(harpoon:list().items, to_remove.idx)
						picker:find({
							refresh = true, -- refresh picker after removing values
						})
					end,
				},
			})
		end) ]]
	end,
}
