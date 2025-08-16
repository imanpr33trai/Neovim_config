return {
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      -- Enable termguicolors if not already
      vim.opt.termguicolors = true

      require('nvim-highlight-colors').setup {}
    end,
  },

  {
    'saghen/blink.cmp', -- adjust this if `blink` is from another author or repo
    dependencies = { 'brenoprata10/nvim-highlight-colors' },
    config = function()
      require('blink.cmp').setup {
        completion = {
          menu = {
            draw = {
              components = {
                kind_icon = {
                  text = function(ctx)
                    local icon = ctx.kind_icon
                    if ctx.item.source_name == 'LSP' then
                      local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                      if color_item and color_item.abbr ~= '' then
                        icon = color_item.abbr
                      end
                    end
                    return icon .. ctx.icon_gap
                  end,

                  highlight = function(ctx)
                    local highlight = 'BlinkCmpKind' .. ctx.kind
                    if ctx.item.source_name == 'LSP' then
                      local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                      if color_item and color_item.abbr_hl_group then
                        highlight = color_item.abbr_hl_group
                      end
                    end
                    return highlight
                  end,
                },
              },
            },
          },
        },
      }
    end,
  },
}
