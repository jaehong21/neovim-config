-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/terraformls.lua
vim.lsp.enable("terraformls")

vim.lsp.config("terraformls", {
	cmd = { "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars", "tf", "hcl" },
})
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- TODO: expect official terragrunt support
			vim.treesitter.language.register("hcl", { "terragrunt" })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
				pattern = "*.hcl",
				command = "set filetype=terragrunt",
			})

			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "terraform", "hcl" })
		end,
	},

	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				-- hcl = { "hclfmt" },
				terraform = { "terraform_fmt" },
				terragrunt = { "terragrunt_hclfmt" },
			},
		},
	},
}
