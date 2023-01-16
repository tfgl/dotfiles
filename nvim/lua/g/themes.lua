THEMES = {
  tokyonight = "tokyonight",
  dracula = "dracula",
}

function SetTheme(theme)
	theme = theme or "tokyonight"

	vim.cmd.colorscheme(theme)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", {bg = "none" })
end

SetTheme()
