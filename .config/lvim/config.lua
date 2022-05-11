--[[
lvim is the global options object

Linters should be filled in as strings with either a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true

lvim.colorscheme = 'onenord'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.notify.active = true

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.terminal.shell = 'fish'

lvim.lsp.automatic_servers_installation = false;

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "fish",
  "c",
  'javascript',
  'typescript',
  "json",
  "lua",
  "python",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

local cmp = require 'cmp'

local icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "⌘",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "廓",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

lvim.builtin.cmp = {
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
  confirmation = {
    get_commit_characters = function()
      return {}
    end,
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, vim_item)
      vim_item.menu = vim_item.kind
      vim_item.kind = icons[vim_item.kind]

      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-q>"] = cmp.mapping.close(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true),
          "",
          true
        )
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true),
          "",
          true
        )
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lsp_signature_help" },
  },
  preselect = cmp.PreselectMode.None,

}
lvim.builtin.telescope.defaults = {
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--no-ignore",
    "--smart-case",
    "--hidden",
  },
  prompt_prefix = "     ",
  selection_caret = "  ",
  entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.55,
      results_width = 0.8,
    },
    vertical = {
      mirror = false,
    },
    width = 0.80,
    height = 0.85,
    preview_cutoff = 120,
  },
  file_sorter = require("telescope.sorters").get_fuzzy_file,
  file_ignore_patterns = { "node_modules", ".git/", "dist/" },
  generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
  path_display = { "absolute" },
  winblend = 0,
  border = {},
  borderchars = { "" },
  color_devicons = true,
  use_less = true,
  set_env = { ["COLORTERM"] = "truecolor" },
  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
  mappings = {
    i = {
      ["<Tab>"] = "move_selection_next",
      ["<S-Tab>"] = "move_selection_previous",
    },
    n = {
      ["<Tab>"] = "move_selection_next",
      ["<S-Tab>"] = "move_selection_previous",
    },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end,
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
      }
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    'rmehri01/onenord.nvim',
    config = function()
      local colors = require("onenord.colors").load()
      colors.dark_gray = '#242932'
      colors.darkest_gray = '#1c1f26'

      require 'onenord'.setup {
        borders = false,
        fade_nc = false,
        styles = {
          comments = "italic",
          strings = "NONE",
          keywords = "NONE",
          functions = "italic",
          variables = "bold",
          diagnostics = "underline",
        },
        disable = {
          background = false,
          cursorline = false,
          eob_lines = true,
        },
        custom_highlights = {
          VertSplit = { fg = colors.dark_gray },

          BufferLineIndicatorSelected = { fg = colors.cyan, bg = colors.bg },
          BufferLineFill = { fg = colors.fg, bg = colors.gray },

          WhichKeyFloat = { bg = colors.dark_gray },

          GitSignsAdd = { fg = colors.green },
          GitSignsChange = { fg = colors.orange },
          GitSignsDelete = { fg = colors.red },

          NvimTreeNormal = { fg = colors.bg, bg = colors.dark_gray },
          NvimTreeFolderIcon = { fg = colors.gray },
          NvimTreeIndentMarker = { fg = colors.gray },

          NormalFloat = { bg = colors.dark_gray },
          FloatBorder = { bg = colors.dark_gray, fg = colors.dark_gray },

          TelescopePromptPrefix = { bg = colors.dark_gray, fg = colors.purple },

          TelescopePromptNormal = { bg = colors.dark_gray, fg = colors.fg },
          TelescopeResultsNormal = { bg = colors.darkest_gray },
          TelescopePreviewNormal = { bg = colors.dark_gray },

          TelescopePromptBorder = { bg = colors.dark_gray, fg = colors.dark_gray },
          TelescopeResultsBorder = { bg = colors.darkest_gray, fg = colors.dark_gray },
          TelescopePreviewBorder = { bg = colors.dark_gray, fg = colors.dark_gray },

          TelescopePromptTitle = { fg = colors.fg_light },
          TelescopeResultsTitle = { fg = colors.fg_light },
          TelescopePreviewTitle = { fg = colors.fg_light },

          PmenuSel = { bg = colors.dark_gray },
          Pmenu = { bg = colors.dark_gray },
          PMenuThumb = { bg = colors.dark_gray },

          LspFloatWinNormal = { fg = colors.fg, bg = colors.dark_gray },
          LspFloatWinBorder = { fg = colors.dark_gray, bg = colors.dark_gray },
        },
      }
    end
  }
}
