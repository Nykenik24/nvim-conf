-- colorscheme
local colorschemes = {
	preferred = "kanagawa",
	[1] = "base16-snazzy",
	[2] = "base16-nord",
	[3] = "base16-circus",
	[4] = "base16-onedark",
	[5] = "base16-gruvbox-dark-hard",
	default = "base16-default-dark",
}

local current_colorscheme = "preferred"

local could_apply_colorscheme = pcall(vim.cmd.colorscheme, colorschemes[current_colorscheme])
if not could_apply_colorscheme then
	vim.notify(
		("Could not apply theme %s, it doesn't exist. Defaulting to base16-default-dark."):format(current_colorscheme),
		"error"
	)
	vim.cmd.colorscheme(colorschemes.default)
end
