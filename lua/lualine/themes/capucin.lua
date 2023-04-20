local C = require("capucin.palettes").get_palette()
local O = require("capucin").options
local capucin = {}

local transparent_bg = O.transparent_background and "NONE" or C.mantle

capucin.normal = {
	a = { bg = C.blue, fg = C.mantle, gui = "bold" },
	b = { bg = C.surface1, fg = C.blue },
	c = { bg = transparent_bg, fg = C.text },
}

capucin.insert = {
	a = { bg = C.green, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.teal },
}

capucin.terminal = {
	a = { bg = C.green, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.teal },
}

capucin.command = {
	a = { bg = C.peach, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.peach },
}

capucin.visual = {
	a = { bg = C.mauve, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.mauve },
}

capucin.replace = {
	a = { bg = C.red, fg = C.base, gui = "bold" },
	b = { bg = C.surface1, fg = C.red },
}

capucin.inactive = {
	a = { bg = transparent_bg, fg = C.blue },
	b = { bg = transparent_bg, fg = C.surface1, gui = "bold" },
	c = { bg = transparent_bg, fg = C.overlay0 },
}

return capucin
