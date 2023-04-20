local M = {}

function M.get_palette(flavour)
	local flvr = flavour or require("capucin").flavour or vim.g.capucin_flavour or "mocha"
	local _, palette = pcall(require, "capucin.palettes." .. flvr)
	local O = require("capucin").options
	return vim.tbl_deep_extend("keep", O.color_overrides.all or {}, O.color_overrides[flvr] or {}, palette or {})
end

return M
