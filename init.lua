-- ==================================================================== --
--                          OPTIONS                                     --
-- ==================================================================== --
-- See `:help vim.o`

local opt = vim.opt

opt.backup = false            -- creates a backup file
opt.conceallevel = 0          -- so that `` is visible in markdown files
opt.pumheight = 10            -- pop up menu height
opt.showtabline = 2           -- always show tabs
opt.smartindent = true        -- make indenting smarter again
opt.hlsearch = true           -- Set highlight on search
opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.number = true             -- Make line numbers default
opt.expandtab = true          -- convert tabs to spaces
opt.mouse = 'a'               -- Enable mouse mode
opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
opt.breakindent = true        -- Enable break indent
opt.undofile = true           -- Save undo history
opt.ignorecase = true         -- Case insensitive searching UNLESS /C or capital in search
opt.smartcase = true
opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
opt.tabstop = 2               -- insert 2 spaces for a tab
opt.cursorline = true         -- highlight the current line
opt.relativenumber = true     -- set relative numbered lines
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "FiraCode Nerd Font"

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
opt.termguicolors = true             -- NOTE: You should make sure your terminal supports this

-- ==================================================================== --
--                          Keymaps                                     --
-- ==================================================================== --

local opts = {
    noremap = true,
    silent = true
}

local term_opts = {
    silent = true
}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   command_mode = ":;/",

-- Normal --
-- Switch between buffers
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Create Split
keymap("n", "<leader>h", ":horizontal split<cr>", {
    desc = "Horizontal Split"
})
keymap("n", "<leader>v", ":vertical split<cr>", {
    desc = "Vertical Split"
})

-- Close Split
keymap("n", "<leader>c", "<C-w>q>", {
    desc = "Close Split"
})
-- Close all Splits
keymap("n", "<leader>a", "<C-w>o>", {
    desc = "Close all Splits"
})

-- Plugins interaction
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", {
    desc = "NvimTree"
})
keymap("n", "<leader>s", ":Telescope find_files<cr>", {
    desc = "Telescope Find Files (search)"
})
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", {
    desc = "Telescope Live Grep"
})
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", {
    desc = "Code Format"
})
keymap("n", "<leader>q", "<cmd>Bdelete<cr>", {
    desc = "Close Selected Buffer"
})
keymap("n", "<leader>p", "<cmd>bp<cr>", {
    desc = "Open Previous Buffer"
})
keymap("n", "<leader>n", "<cmd>bn<cr>", {
    desc = "Open next Buffer"
})

-- Open a specific buffer
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", {
    desc = "Open Buffer 1"
})
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", {
    desc = "Open Buffer 2"
})
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", {
    desc = "Open Buffer 3"
})
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", {
    desc = "Open Buffer 4"
})
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", {
    desc = "Open Buffer 5"
})
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", {
    desc = "Open Buffer 6"
})
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", {
    desc = "Open Buffer 7"
})
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", {
    desc = "Open Buffer 8"
})
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", {
    desc = "Open Buffer 9"
})

-- Toggle term
-- Avoid keybinding conflicts
function _G.set_terminal_keymaps()
    local opts = {
        noremap = true
    }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ==================================================================== --
--                          Plugin Manager                              --
-- ==================================================================== --
-- Install package manager
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn
        .system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', -- latest stable release
            lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- ==================================================================== --
--                          Plugins                                     --
-- ==================================================================== --
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
require('lazy').setup({                            -- Git related plugins
    'tpope/vim-fugitive',                          -- Use Git from neovim with :Git
    'tpope/vim-rhubarb',                           -- Same, but for GitHub
    'numToStr/Comment.nvim',                       -- Comment code with shortcuts
    'JoosepAlviste/nvim-ts-context-commentstring', -- Change comment type for JS files
    'moll/vim-bbye',                               -- Bdelete command
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = { -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', {
            'j-hui/fidget.nvim',
            opts = {}
        }, 'folke/neodev.nvim' }
    },
    {
        -- Autocompletion / Snippets
        'hrsh7th/nvim-cmp',
        dependencies = { 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' }
    },
    {
        'folke/which-key.nvim',
        opts = {}
    },
    {
        'glepnir/dashboard-nvim', -- Home Screen
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'doom',
                config = {
                    header = { '', '', '', '', '', '', '',
                        '███╗   ██╗███████╗ ██████╗ ██████╗ ██████╗ ██╗███████╗███╗   ███╗',
                        '████╗  ██║██╔════╝██╔═══██╗██╔══██╗██╔══██╗██║██╔════╝████╗ ████║',
                        '██╔██╗ ██║█████╗  ██║   ██║██████╔╝██████╔╝██║███████╗██╔████╔██║',
                        '██║╚██╗██║██╔══╝  ██║   ██║██╔═══╝ ██╔══██╗██║╚════██║██║╚██╔╝██║',
                        '██║ ╚████║███████╗╚██████╔╝██║     ██║  ██║██║███████║██║ ╚═╝ ██║',
                        '╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚═╝     ╚═╝',
                        '', '', '',
                        '',
                        '' },
                center = {
                        icon = "  ",
                        desc = "Find  File",
                        action = "Leaderf file --popup",
                        shortcut = "<Leader> f f",
                    },
                    {
                        icon = "  ",
                        desc = "Recently opened files",
                        action = "Leaderf mru --popup",
                        shortcut = "<Leader> f r",
                    },
                    {
                        icon = "  ",
                        desc = "Project grep",
                        action = "Leaderf rg --popup",
                        shortcut = "<Leader> f g",
                    },
                    {
                        icon = "  ",
                        desc = "Open Nvim config",
                        action = "tabnew $MYVIMRC | tcd %:p:h",
                        shortcut = "<Leader> e v",
                    },
                    {
                        icon = "  ",
                        desc = "New file",
                        action = "enew",
                        shortcut = "e",
                    },
                    {
                        icon = "  ",
                        desc = "Quit Nvim",
                        -- desc = "Quit Nvim",
                        action = "qa",
                        shortcut = "q",
                    },
                    },
                    footer = { '💫 github.com/RevenMaster996/NeoPrism' }
                }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = {
                    text = '+'
                },
                change = {
                    text = '~'
                },
                delete = {
                    text = '_'
                },
                topdelete = {
                    text = '‾'
                },
                changedelete = {
                    text = '~'
                }
            }
        }
    }, {
    -- Color Theme
    'Mofiqul/dracula.nvim',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme 'dracula'
    end
}, {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = true,
            theme = 'dracula',
            component_separators = {
                left = '',
                right = ''
            },
            section_separators = {
                left = '',
                right = ''
            },
            disabled_filetypes = {
                statusline = {},
                winbar = {}
            },
            -- disabled_filetypes = { 'packer', 'NvimTree' },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'fugitive', 'man', 'nvim-tree', 'toggleterm' }
    }
}, {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false
    }
}, -- "gcc" or "gc" to comment visual regions/lines and "gb" to block comment
    {
        'numToStr/Comment.nvim',
        opts = {}
    }, {
    'windwp/nvim-autopairs',
    opts = {}
}, {
    'kyazdani42/nvim-tree.lua',
    opts = {
        view = {
            width = 30,
            side = "right"
        }
    }
}, {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
}, {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- Verifies if the plugin can be installed safely without compiling errors
    build = 'make',
    cond = function()
        return vim.fn.executable 'make' == 1
    end
}, {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
        pcall(require('nvim-treesitter.install').update {
            with_sync = true
        })
        opts = {
            ensure_installed = { 'c', 'rust', 'lua', 'vim', 'bash', 'markdown' },
            sync_install = false,
            ignore_install = { "" }, -- List of parsers to ignore installing
            autopairs = {
                enable = true
            },
            highlight = {
                enable = true,    -- false will disable the whole extension
                disable = { "" }, -- list of language that will be disabled
                additional_vim_regex_highlighting = true
            },
            indent = {
                enable = true,
                disable = { "yaml" }
            }
        }
    end
},
    {
        'akinsho/toggleterm.nvim',
        opts = {
            size = 10,
            open_mapping = [[<c-t>]], -- CTRL + t to open term
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "horizontal", -- float, vertical...
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "curved",
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal"
                }
            }
        }
    },
    {
        'akinsho/bufferline.nvim',
        opts = {
            options = {
                numbers = "none",
                close_command = "Bdelete! %d",
                right_mouse_command = "Bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,
                indicator = {
                    style = 'icon',
                    icon = '|' -- If style it's an icon this can be used as a default
                },
                buffer_close_icon = "",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 30,
                max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
                tab_size = 21,
                diagnostics = false,    -- | "nvim_lsp" | "coc",
                diagnostics_update_in_insert = false,
                offsets = { {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true
                } },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                ensure_installed = { 'c', 'rust', 'lua', 'vim', 'bash', 'markdown' },
                sync_install = false,
                ignore_install = { "" }, -- List of parsers to ignore installing
                autopairs = {
                    enable = true
                },
                highlight = {
                    enable = true,    -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = true
                },
                indent = {
                    enable = true,
                    disable = { "yaml" }
                },
                show_tab_indicators = true,
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = true,
                always_show_bufferline = true
                -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                --   -- add custom logic
                --   return buffer_a.modified > buffer_b.modified
                -- end
            }
        }
    }
}, {})

-- ==================================================================== --
--                          Telescope                                   --
-- ==================================================================== --
-- Telescope is configured below to allow for more complex customization.

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key -- keys from pressing <C-/>
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["?"] = actions.which_key
            }
        }
    }
}

-- ==================================================================== --
--                          LSP Configurations                          --
--         Langauge Server - Error checking / Custom lang features      --
-- ==================================================================== --

-- Install lang servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local servers = {
    "lua_ls",
    "rust_analyzer",
    "clangd"
}

local settings = {
    max_concurrent_installers = 2,
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local on_attach = function(_, _) -- MUDAR ESTA DESGRAÇA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! OLHA PARA MIM ESTOU AQUI !!!!!!!!!!!!!!!!!!!!!!
    keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename all definitions" })
    keymap('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions" })

    keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Jump to the definition of the symbol under the cursor" })
    keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Implementation" })
    keymap('n', 'gr', require('telescope.builtin').lsp_references, { desc = "References of functions" })
    keymap('n', '<leader>k', vim.lsp.buf.hover, { desc = "Documentation" })
end

for _, server in ipairs(servers) do
    require("lspconfig")[server].setup({
        on_attach = on_attach,
    })
end

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    }
}


-- ==================================================================== --
--                          CMP Configuration                           --
--                    Autocompletion and Snippets                       --
-- ==================================================================== --

local cmp = require 'cmp'
local luasnip = require 'luasnip'

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

--luasnip.config.setup {}

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}
