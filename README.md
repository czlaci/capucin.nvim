<!-- panvimdoc-ignore-start -->

<h3 align="center">
    Capucin for <a href="https://github.com/neovim/neovim">(Neo)</a><a href="https://github.com/vim/vim">vim</a>
    <img src="https://raw.githubusercontent.com/capucin/capucin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
    <a href="https://github.com/czlaci/capucin.nvim/stargazers"><img src="https://img.shields.io/github/stars/czlaci/capucin.nvim?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
    <a href="https://github.com/czlaci/capucin.nvim/issues"><img src="https://img.shields.io/github/issues/czlaci/capucin.nvim?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
    <a href="https://github.com/czlaci/capucin.nvim/contributors"><img src="https://img.shields.io/github/contributors/czlaci/capucin.nvim?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
This port of <a href="https://github.com/czlaci/capucin.nvim/">Capucin</a> is special because it was the first one and the one that originated the project itself. Given this, it's important to acknowledge that it all didn't come to be what it is now out of nowhere. So, if you are interested in knowing more about the initial stages of the theme, you can find it under the <a href="https://github.com/czlaci/capucin.nvim/tree/v0.1">v0.1</a> tag
</p>

# Features

- Supports both vim and neovim (Requires [neovim](https://github.com/neovim/neovim/) >= 0.8 or [vim](https://github.com/vim/vim) >= 9 compiled with [lua](https://github.com/lua/lua) >= 5.1)
- Highly configurable with 4 different flavours and [ability to create your own!](https://github.com/capucin/nvim/discussions/323)
- [Compile](https://github.com/capucin/nvim#Compile) user config for [fastest startuptime](https://www.reddit.com/r/neovim/comments/xxfpt3/capucinnvim_now_startup_in_1ms/)
- Integrations with lsp, treesitter and [a bunch of plugins](https://github.com/capucin/nvim#integrations)
- Supports for [many other applications](https://github.com/capucin/capucin)

# Installation

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ "capucin/nvim", name = "capucin" }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "capucin/nvim", as = "capucin" }
```

[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'capucin/nvim', { 'as': 'capucin' }
```

# Usage

```vim
colorscheme capucin " capucin-latte, capucin-frappe, capucin-macchiato, capucin-mocha
```

```lua
vim.cmd.colorscheme "capucin"
```

# Configuration

There is no need to call `setup` if you don't want to change the default options and settings.

```lua
require("capucin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/capucin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "capucin"
```

Although settings already have self-explanatory names, here is where you can find info about each one of them and their classifications!

## General

This settings are unrelated to any group and are independent.

- `background`: (Table) Match :set background=light/dark with :Capucin background.light/dark
- `term_colors`: (Boolean) if true, sets terminal colors (e.g. `g:terminal_color_0`).
- `transparent_background`: (Boolean) if true, disables setting the background color.

## Dim inactive

This setting manages the ability to dim the inactive splits/windows/buffers displayed.

- `enabled`: (Boolean) if true, dims the background color of inactive window or buffer or split.
- `shade`: (string) sets the shade to apply to the inactive split or window or buffer.
- `percentage`: (number 0 < x < 1) percentage of the shade to apply to the inactive window, split or buffer.

## Styles

Handles the style of general hi groups (see `:h highlight-args`):

- `comments`: (Table) changed the style of the comments.
- `functions`: (Table) changed the style of the functions.
- `keywords`: (Table) changed the style of the keywords.
- `strings`: (Table) changed the style of the strings.
- `variables`: (Table) changed the style of the variables.

# Customize highlights

## Get capucin colors

```lua
local latte = require("capucin.palettes").get_palette "latte"
local frappe = require("capucin.palettes").get_palette "frappe"
local macchiato = require("capucin.palettes").get_palette "macchiato"
local mocha = require("capucin.palettes").get_palette "mocha"
```

Will returns a table where the key is the name of the color and the value is its hex value corresponding to each flavour.

## Overwriting colors

Colors can be overwritten using `color_overrides` in the setting, like so:

```lua
require("capucin").setup {
    color_overrides = {
        all = {
            text = "#ffffff",
        },
        latte = {
            base = "#ff0000",
            mantle = "#242424",
            crust = "#474747",
        },
        frappe = {},
        macchiato = {},
        mocha = {},
    }
}
```

<details>
<summary> <ins> Click here to see color palette document <ins></summary>

| Name      | Latte     | Frappe    | Macchiato | Mocha     | Usage           |
| --------- | --------- | --------- | --------- | --------- | --------------- |
| rosewater | `#dc8a78` | `#F2D5CF` | `#F4DBD6` | `#F5E0DC` | Winbar          |
| flamingo  | `#DD7878` | `#EEBEBE` | `#F0C6C6` | `#F2CDCD` | Target word     |
| pink      | `#ea76cb` | `#F4B8E4` | `#F5BDE6` | `#F5C2E7` | Just pink       |
| mauve     | `#8839EF` | `#CA9EE6` | `#C6A0F6` | `#CBA6F7` | Tag             |
| red       | `#D20F39` | `#E78284` | `#ED8796` | `#F38BA8` | Error           |
| maroon    | `#E64553` | `#EA999C` | `#EE99A0` | `#EBA0AC` | Lighter red     |
| peach     | `#FE640B` | `#EF9F76` | `#F5A97F` | `#FAB387` | Number          |
| yellow    | `#df8e1d` | `#E5C890` | `#EED49F` | `#F9E2AF` | Warning         |
| green     | `#40A02B` | `#A6D189` | `#A6DA95` | `#A6E3A1` | Diff add        |
| teal      | `#179299` | `#81C8BE` | `#8BD5CA` | `#94E2D5` | Hint            |
| sky       | `#04A5E5` | `#99D1DB` | `#91D7E3` | `#89DCEB` | Operator        |
| sapphire  | `#209FB5` | `#85C1DC` | `#7DC4E4` | `#74C7EC` | Constructor     |
| blue      | `#1e66f5` | `#8CAAEE` | `#8AADF4` | `#89B4FA` | Diff changed    |
| lavender  | `#7287FD` | `#BABBF1` | `#B7BDF8` | `#B4BEFE` | CursorLine Nr   |
| text      | `#4C4F69` | `#c6d0f5` | `#CAD3F5` | `#CDD6F4` | Default fg      |
| subtext1  | `#5C5F77` | `#b5bfe2` | `#B8C0E0` | `#BAC2DE` | Indicator       |
| subtext0  | `#6C6F85` | `#a5adce` | `#A5ADCB` | `#A6ADC8` | Float title     |
| overlay2  | `#7C7F93` | `#949cbb` | `#939AB7` | `#9399B2` | Popup fg        |
| overlay1  | `#8C8FA1` | `#838ba7` | `#8087A2` | `#7F849C` | Conceal color   |
| overlay0  | `#9CA0B0` | `#737994` | `#6E738D` | `#6C7086` | Fold color      |
| surface2  | `#ACB0BE` | `#626880` | `#5B6078` | `#585B70` | Default comment |
| surface1  | `#BCC0CC` | `#51576d` | `#494D64` | `#45475A` | Darker comment  |
| surface0  | `#CCD0DA` | `#414559` | `#363A4F` | `#313244` | Darkest comment |
| base      | `#EFF1F5` | `#303446` | `#24273A` | `#1E1E2E` | Default bg      |
| mantle    | `#E6E9EF` | `#292C3C` | `#1E2030` | `#181825` | Darker bg       |
| crust     | `#DCE0E8` | `#232634` | `#181926` | `#11111B` | Darkest bg      |
</details>

## Overwriting highlight groups

Global highlight groups can be overwritten in the setting like so:

```lua
custom_highlights = function(colors)
    return {
        <hl_group> = { <fields> }
    }
end
```

Here is an example:

```lua
require("capucin").setup {
    custom_highlights = function(colors)
        return {
            Comment = { fg = colors.flamingo },
            ["@constant.builtin"] = { fg = colors.peach, style = {} },
            ["@comment"] = { fg = colors.surface2, style = { "italic" } },
        }
    end
}
```

Per flavour highlight groups can be overwritten in the setting like so:

```lua
highlight_overrides = {
    all = function(colors) -- Global highlight, will be replaced with custom_highlights if exists
        return {
            <hl_group> = { <fields> }
        }
    end, -- Same for each flavour
    latte = function(latte) end,
    frappe = function(frappe) end,
    macchiato = function(macchiato) end,
    mocha = function(mocha) end,
}
```

Here is an example:

```lua
require("capucin").setup {
  highlight_overrides = {
        all = function(colors)
            return {
                NvimTreeNormal = { fg = colors.none },
                CmpBorder = { fg = "#3e4145" },
            }
        end,
        latte = function(latte)
            return {
                Normal = { fg = latte.base },
            }
        end,
        frappe = function(frappe)
            return {
                ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
            }
        end,
        macchiato = function(macchiato)
            return {
                LineNr = { fg = macchiato.overlay1 },
            }
        end,
        mocha = function(mocha)
            return {
                Comment = { fg = mocha.flamingo },
            }
        end,
    },
}
```

# Integrations

capucin-nvim provides theme support for other plugins in the Neovim ecosystem and extended Neovim functionality through _integrations_.

Below is a list of supported plugins and their corresponding integration module. (See [Special integrations](https://github.com/capucin/nvim#special-integrations) for more.)

| Plugin                                                                                | Module              |
| ------------------------------------------------------------------------------------- | ------------------- |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim)                                | aerial              |
| [barbar.nvim](https://github.com/romgrk/barbar.nvim)                                  | barbar              |
| [barbecue.nvim](https://github.com/utilyre/barbecue.nvim)                             | barbecue, Special   |
| [beacon.nvim](https://github.com/DanilaMihailov/beacon.nvim)                          | beacon              |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                         | Special             |
| [coc.nvim](https://github.com/neoclide/coc.nvim)                                      | coc_nvim, Special   |
| [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)                           | dashboard           |
| [feline.nvim](https://github.com/feline-nvim/feline.nvim/)                            | Special             |
| [fern.vim](https://github.com/lambdalisue/fern.vim)                                   | fern                |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim)                                   | Special             |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                           | gitsigns            |
| [harpoon](https://github.com/ThePrimeagen/harpoon)                                    | harpoon             |
| [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim)                     | headlines           |
| [hop.nvim](https://github.com/phaazon/hop.nvim)                                       | hop                 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)       | Special             |
| [leap.nvim](https://github.com/ggandor/leap.nvim)                                     | leap                |
| [lightline.vim](https://github.com/itchyny/lightline.vim)                             | Special             |
| [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)                         | lightspeed          |
| [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim/)                              | lsp_saga, Special   |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                          | Special             |
| [markdown](https://www.markdownguide.org/)                                            | markdown            |
| [mason](https://github.com/williamboman/mason.nvim)                                   | mason               |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                 | mini                |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)                       | neotree             |
| [neogit](https://github.com/TimUntersberger/neogit)                                   | neogit              |
| [neotest](https://github.com/nvim-neotest/neotest)                                    | neotest             |
| [noice.nvim](https://github.com/folke/noice.nvim)                                     | noice               |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                       | cmp                 |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)                                | dap, Special        |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap)                                  | dap, Special        |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                            | native_lsp, Special |
| [nvim-navic](https://github.com/SmiteshP/nvim-navic/)                                 | navic, Special      |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)                                | notify              |
| [nvim-semantic-tokens](https://github.com/theHamsta/nvim-semantic-tokens)             | semantic_tokens     |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                          | nvimtree            |
| [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) | treesitter_context  |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                 | treesitter          |
| [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow)                            | ts_rainbow          |
| [nvim-ts-rainbow2](https://github.com/HiPhish/nvim-ts-rainbow2)                       | ts_rainbow2         |
| [octo.nvim](https://github.com/pwntester/octo.nvim)                                   | octo                |
| [overseer.nvim](https://github.com/stevearc/overseer.nvim)                            | overseer            |
| [pounce.nvim](https://github.com/rlane/pounce.nvim)                                   | pounce              |
| [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)              | symbols_outline     |
| [telekasten.nvim](https://github.com/renerocksai/telekasten.nvim)                     | telekasten          |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                    | telescope           |
| [trouble.nvim](https://github.com/folke/trouble.nvim)                                 | lsp_trouble         |
| [vim-airline](https://github.com/vim-airline/vim-airline)                             | Special             |
| [vim-clap](https://github.com/liuchengxu/vim-clap)                                    | Special             |
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter)                            | gitgutter           |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate)                            | illuminate          |
| [vim-sandwich](https://github.com/machakann/vim-sandwich)                             | sandwich            |
| [vim-sneak](https://github.com/justinmk/vim-sneak)                                    | vim_sneak           |
| [vimwiki](https://github.com/vimwiki/vimwiki)                                         | vimwiki             |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                             | which_key           |

> "Special" module means Special integrations, see <https://github.com/capucin/nvim#special-integrations> for more details

These integrations allow capucin to set the theme of various plugins. To enable an integration you just need to set it to `true`, for example:

```lua
require("capucin").setup({
    integrations = {
        <module> = <boolean>
    }
})
```

<details> <summary> <ins> Click here to see an example config </ins> </summary>

```lua
require("capucin").setup({
    integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dashboard = true,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        headlines = false,
        hop = false,
        illuminate = false,
        leap = false,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        markdown = true,
        mason = true,
        mini = false,
        neogit = false,
        neotest = false,
        neotree = false,
        noice = false,
        notify = false,
        nvimtree = true,
        octo = false,
        overseer = false,
        pounce = false,
        sandwich = false,
        semantic_tokens = false,
        symbols_outline = false,
        telekasten = false,
        telescope = true,
        treesitter = true,
        treesitter_context = false,
        ts_rainbow = false,
        ts_rainbow2 = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = false,

        -- Special integrations, see https://github.com/capucin/nvim#special-integrations
        barbecue = {
            dim_dirname = true,
            bold_basename = true,
            dim_context = false,
            alt_background = false,
        },
        dap = {
            enabled = false,
            enable_ui = false,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        navic = {
            enabled = false,
            custom_bg = "NONE",
        },
    },
})
```

</details>

## Special integrations


<details> <summary>barbecue.nvim</summary>

Use this to set it up (**Note**: `capucin` is the only valid theme name. It will pick the one set in your config):

```lua
require("barbecue").setup {
  theme = "capucin",
}
```

The directory name color shown is dimmed by default, you can customize this setting.

```lua
integrations = {
  barbecue = {
    dim_dirname = true,
    bold_basename = true,
    dim_context = false,
  }
}
```
</details>

<details> <summary>bufferline.nvim</summary>

Update your bufferline config to use the Capucin components:

> **Note**: bufferline needs to be loaded after setting up capucin or it will highlight incorrectly

```lua
use "akinsho/bufferline.nvim" {
  after = "capucin",
  config = function()
    require("bufferline").setup {
      highlights = require("capucin.groups.integrations.bufferline").get()
    }
  end
}
```

Configurations are self-explanatory, see `:h bufferline-highlights` for detailed explanations:

```lua
local mocha = require("capucin.palettes").get_palette "mocha"
bufferline.setup {
    highlights = require("capucin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            mocha = {
                background = { fg = mocha.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    },
}
```

</details>

<details> <summary>coc.nvim</summary>

Setting `enabled` to `true` enables this integration. 

```lua
coc_nvim = true,
```
> **Note**: coc.nvim by default link to native lsp highlight groups so config from `native_lsp` will also apply to coc

In the inners tables you can set the style for the diagnostics, both `virtual_text` (what you see on the side) and `underlines` (what points directly at the thing (e.g. an error)).

```
native_lsp = {
    enabled = true,
    virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
    },
},
```

</details>

<details> <summary>feline.nvim</summary>

Update your Feline config to use the Capucin components:

```lua
local ctp_feline = require('capucin.groups.integrations.feline')

ctp_feline.setup()

require("feline").setup({
    components = ctp_feline.get(),
})
```

Notice that calling `setup()` is optional. You may pass a lua table in order to change assets, settings and the colors per vim mode.

Here are the defaults:

```lua
local clrs = require("capucin.palettes").get_palette()
local ctp_feline = require('capucin.groups.integrations.feline')
local U = require "capucin.utils.colors"

ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "",
        file = "",
        lsp = {
            server = "",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
        text = U.vary_color({ latte = latte.base }, clrs.surface0),
        bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        [""] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        [""] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})
```

> **Note**: Currently feline [doesn't officially support custom themes](https://github.com/feline-nvim/feline.nvim/issues/302). In order for `:colorscheme capucin-<flavour>` to work you could add this autocmd as a workaround:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        package.loaded["feline"] = nil
        package.loaded["capucin.groups.integrations.feline"] = nil
        require("feline").setup {
            components = require("capucin.groups.integrations.feline").get(),
        }
    end,
})
```

</details>

<details> <summary>fidget.nvim</summary>

Set fidget module to `true`

```lua
fidget = true
```

Then set `window.blend` to `0`:

```lua
require("fidget").setup {
    window = {
        blend = 0,
    },
    -- ... the rest of your fidget config
}
```

</details>

<details> <summary>indent-blankline.nvim</summary>

Setting `enabled` to `true` enables this integration. `colored_indent_levels` enables char highlights per indent level. Follow the instructions [here](https://github.com/lukas-reineke/indent-blankline.nvim#with-custom-gindent_blankline_char_highlight_list) to set the latter up.

```lua
indent_blankline = {
    enabled = true,
    colored_indent_levels = false,
},
```

</details>

<details> <summary>lightline.vim</summary>

Use this to set it up (**Note**: `capucin` is the only valid colorscheme name. It will pick the one set in your config):

```vim
let g:lightline = {'colorscheme': 'capucin'}
```

</details>


<details> <summary>lspsaga.nvim</summary>

For custom Lsp Kind Icon and Color

```lua
require("lspsaga").setup {
    ui = {
        kind = require("capucin.groups.integrations.lsp_saga").custom_kind(),
    },
}
```

</details>

</details>

<details> <summary>lualine.nvim</summary>

Use this to set it up (**Note**: `capucin` is the only valid theme name. It will pick the one set in your config):

```lua
require('lualine').setup {
    options = {
        theme = "capucin"
        -- ... the rest of your lualine config
    }
}
```

</details>

</details>

<details> <summary>nvim-dap</a> & nvim-dap-ui</a> </summary>

Setting `enabled` to `true`:

```lua
integration = {
    dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
    }
}
```

```lua
-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
require("dap")

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
```

</details>

<details> <summary>nvim-lspconfig</summary>

Setting `enabled` to `true` enables this integration. In the inners tables you can set the style for the diagnostics, both `virtual_text` (what you see on the side) and `underlines` (what points directly at the thing (e.g. an error)).

```lua
native_lsp = {
    enabled = true,
    virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
    },
    underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
    },
},
```

</details>

<details> <summary>nvim-navic</summary>

Setting `enabled` to `true`:

```lua
navic = {
    enabled = false,
    custom_bg = "NONE",
},
```

```lua
-- You NEED to enable highlight in nvim-navic setting or it won't work
require("nvim-navic").setup {
    highlight = true
}
```

</details>

<details> <summary>vim-airline</summary>

Use this to set it up (**Note**: `capucin` is the only valid colorscheme name. It will pick the one set in your config):

```vim
let g:airline_theme = 'capucin'
```

</details>

</details>

<details> <summary>vim-clap</summary>

Use this to set it up:

```vim
let g:clap_theme = 'capucin'
```

</details>

If you'd like to know which highlight groups are being affected by capucin, check out this directory: [`lua/capucin/groups/integrations/`](https://github.com/capucin/nvim/tree/main/lua/capucin/groups/integrations).

# Compile

> **Note**: As of 7/10/2022, capucin should be able to automatically recompile when the setup table changed.

Capucin is a highly customizable and configurable colorscheme. This does however come at the cost of complexity and execution time.

Capucin can pre compute the results of your configuration and store the results in a compiled lua file. We use these precached values to set it's highlights.

## Config

By default capucin writes the compiled results into the system's cache directory. You can change the cache dir using:

```lua
require("capucin").setup({ -- Note: On windows we replace `/` with `\` by default
    compile_path = vim.fn.stdpath "cache" .. "/capucin"
})
```

## Compile commands

```vim
:CapucinCompile " Create/update the compile file
```

```lua

require('capucin').compile() -- Capucin also provide a function to work with the capucin compiler.
```

## Hooks

Use them to execute code at certain events. These are the ones available:

| Autocmd          | Description                  |
| ---------------- | ---------------------------- |
| `ColorSchemePre` | Before loading a colorscheme |
| `ColorScheme`    | After loading a colorscheme  |

They can be used like so:

```lua
vim.api.nvim_create_autocmd("ColorSchemePre", {
    pattern = "*",
    callback = function()
        print "I ran before loading Capucin!"
    end
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local colors = require("capucin.palettes").get_palette()
        -- do something with colors
    end
})
```

# FAQ

## Switch Capucin flavour on the fly

```lua
:Capucin mocha/macchiato/frappe/latte
```

> **Note**: the command has autocompletion enabled, so you can just press tab to cycle through the flavours

## Load other custom highlights later

```lua
require("capucin.lib.highlighter").syntax()
```

For example:

```lua
local colors = require("capucin.palettes").get_palette() -- fetch colors from palette
require("capucin.lib.highlighter").syntax({
    Comment = { fg = colors.surface0 }
})
```

> **Note**: Unlike the `:highlight` command which can update a highlight group, this function completely replaces the definition. (`:h nvim_set_hl`)

## Wrong treesitter highlights

Please disable `additional_vim_regex_highlighting`

```lua
require("nvim-treesitter.configs").setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
}
```

## Colors doesn't match preview screenshots

Capucin requires true color support AKA terminals support the full range of 16 million colors

- Supported: iterm2 (macOS), kitty, wezterm, alacritty, tmux, ...

Full list of support terminals can be found here: <https://github.com/termstandard/colors#truecolor-support-in-output-devices>

- Unsupported terminal: Terminal.app (macOS), Terminus, Terminology, ...

Full list of Unsupported terminals can be found here: <https://github.com/termstandard/colors#not-supporting-truecolor>

# Thanks to

- [Pocco81](https://github.com/Pocco81)
- [nullchilly](https://github.com/nullchilly)
- [catppuccin](https://github.com/catppuccin)

<!-- panvimdoc-ignore-start -->

&nbsp;

<!-- panvimdoc-ignore-end -->
