THEMES = {
  tokyonight = "tokyonight",
  tokyonightMoon = "tokyonight-moon",
  dracula = "dracula",
}

function Set_theme(theme)
	theme = theme or THEMES.tokyonight

	vim.cmd.colorscheme(theme)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", {bg = "none" })
end

Set_theme()
