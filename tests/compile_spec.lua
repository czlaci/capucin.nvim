describe("compile", function()
	before_each(function()
		for name, _ in pairs(package.loaded) do
			if name:match "^capucin" and name ~= "capucin" then package.loaded[name] = nil end
		end
	end)
	it("without setup", function()
		assert.equals(pcall(function() require("capucin").compile() end), true)
	end)
	it("user 1", function()
		require("capucin").setup {
			custom_highlight = function(C)
				return {
					SpellBad = { cterm = { underdashed = true } },
				}
			end,
		}
		assert.equals(pcall(function() require("capucin").compile() end), true)
	end)
end)
