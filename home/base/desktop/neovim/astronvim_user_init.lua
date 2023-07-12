return {
  colorscheme = "catppuccin",

  options = {
    opt = {
      cmdheight = 0, -- Do not display cmd line(use noice.nvim instead)
      relativenumber = true, -- Show relative numberline
      signcolumn = "auto", -- Show sign column when used only
      spell = true, -- Enable spell checking
    },
  },

  plugins = {
    "AstroNvim/astrocommunity",
    -- colorscheme - catppuccin
    { import = "astrocommunity.colorscheme.catppuccin" },
    -- Highly experimental plugin that completely replaces
    -- the UI for messages, cmdline and the popupmenu.
    { import = "astrocommunity.utility.noice-nvim" },
    -- Fully featured & enhanced replacement for copilot.vim
    -- <Tab> work with both auto completion in cmp and copilot
    { import = "astrocommunity.completion.copilot-lua" },
    { import = "astrocommunity.media.vim-wakatime" },
    { import = "astrocommunity.motion.leap-nvim" },
    { import = "astrocommunity.motion.flit-nvim" },
    { import = "astrocommunity.scrolling.nvim-scrollbar" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    -- Language Support
    ---- Frontend & NodeJS
    { import = "astrocommunity.pack.typescript-all-in-one" },
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.prisma" },
    { import = "astrocommunity.pack.vue" },
    ---- Configuration Language
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.toml" },
    ---- Backend
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.java" },
    { import = "astrocommunity.pack.nix" },
    { import = "astrocommunity.pack.proto" },
    { import = "astrocommunity.pack.terraform" },
    ---- Operation & Cloud Native
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.cmake" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.lua" },

    -- File explorer(Custom configs)
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
          },
        },
      }
    },
    -- Language Parser for syntax highlighting / indentation / folding / Incremental selection
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          -- neovim
          "vim",
          "lua",
          
          -- operation & cloud native
          "hcl",
          "jsonnet",
          "regex",
          "terraform",
        },
      },
    },
  },

  lsp = {
    config = {
      -- the offset_encondings of clangd will confilicts whit null-ls
      -- so we need to manually set it to utf-8
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        },
      },
    },
    servers = {
      "bashls",
      "clangd",   -- c/c++ language server
      "cmake",
      "cssls",
      "dockerls",
      "eslint",
      "gopls",
      "html",
      "jdtls",  -- java language server
      "jsonls",  -- json language server
      "jsonnet_ls",  -- jsonnet language server
      "lua_ls",
      "pyright",  -- python language server
      "nil_ls",  -- nix language server
      "rust_analyzer",
      "sqlls",   -- sql language server
      "terraformls",
      "tsserver",
      "yamlls",
    },
    formatting = {
      disabled = {
        -- use null-ls' gofumpt/goimports instead
        -- https://github.com/golang/tools/pull/410
        "gopls",
        -- use null-ls' prettier instead
        "tsserver",
      },
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "go",
          "jsonnet",
          "rust",
          "terraform",
        },
      },
    },
  },
}
