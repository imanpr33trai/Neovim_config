-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup()
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
  {
    -- Completion engine
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        -- "L3MON4D3/LuaSnip", -- Uncomment if using LuaSnip
        -- "saadparwaiz1/cmp_luasnip",
        -- "SirVer/ultisnips",
        -- "quangnguyen30192/cmp-nvim-ultisnips",
        -- "dcampos/nvim-snippy",
        -- "dcampos/cmp-snippy",
      },

      config = function()
        local cmp = require 'cmp'

        cmp.setup {
          snippet = {
            expand = function(args)
              -- Using vsnip
              vim.fn['vsnip#anonymous'](args.body)

              -- Other snippet engines
              -- require("luasnip").lsp_expand(args.body)
              -- require("snippy").expand_snippet(args.body)
              -- vim.fn["UltiSnips#Anon"](args.body)
            end,
          },

          mapping = cmp.mapping.preset.insert {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm { select = true },
          },

          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            -- { name = "luasnip" },
            -- { name = "ultisnips" },
            -- { name = "snippy" },
          }, {
            { name = 'buffer' },
          }),
        }

        -- Cmdline completion for `/` and `?`
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' },
          },
        })

        -- Cmdline completion for `:`
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' },
          }, {
            { name = 'cmdline' },
          }),
          matching = { disallow_symbol_nonprefix_matching = false },
        })

        -- Optional: Git completion (uncomment if using cmp-git)
        -- require("cmp_git").setup()
      end,
    },

    -- LSP Config
    {
      'neovim/nvim-lspconfig',
      config = function()
        local lspconfig = require 'lspconfig'
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Replace <YOUR_LSP_SERVER> with your actual servers
        local servers = {

          'html',
          'cssls',
          'jsonls',
          'pyright',
          'intelephense',
          'clangd',
          'bashls',
          'vtsls',
        }

        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            capabilities = capabilities,
          }
        end
      end,
    },
  },{
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
},
  { 'echasnovski/mini.surround', version = '*' },
  {
  "karb94/neoscroll.nvim",
  opts = {},
},
{
  "sphamba/smear-cursor.nvim",
  opts = {},
},
{
    "tris203/precognition.nvim",
    --event = "VeryLazy",
    opts = {
    -- startVisible = true,
    -- showBlankVirtLine = true,
    -- highlightColor = { link = "Comment" },
    -- hints = {
    --      Caret = { text = "^", prio = 2 },
    --      Dollar = { text = "$", prio = 1 },
    --      MatchingPair = { text = "%", prio = 5 },
    --      Zero = { text = "0", prio = 1 },
    --      w = { text = "w", prio = 10 },
    --      b = { text = "b", prio = 9 },
    --      e = { text = "e", prio = 8 },
    --      W = { text = "W", prio = 7 },
    --      B = { text = "B", prio = 6 },
    --      E = { text = "E", prio = 5 },
    -- },
    -- gutterHints = {
    --     G = { text = "G", prio = 10 },
    --     gg = { text = "gg", prio = 9 },
    --     PrevParagraph = { text = "{", prio = 8 },
    --     NextParagraph = { text = "}", prio = 8 },
    -- },
    -- disabled_fts = {
    --     "startify",
    -- },
    },
},
}
