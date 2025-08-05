vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require 'telescope'.load_extension('project')

local project_actions = require('telescope._extensions.project.actions')
require('telescope').setup {
  extensions = {
    project = {
      base_dirs = {
        { '~/Projects/work', max_depth = 1 },
        { '~/.config/nvim/', max_depth = 1 },
      }
    },
    sync_with_nvim_tree = true,
    mappings = {
      n = {
        ['d'] = project_actions.delete_project,
        ['r'] = project_actions.rename_project,
        ['c'] = project_actions.add_project,
        ['C'] = project_actions.add_project_cwd,
        ['f'] = project_actions.find_project_files,
        ['b'] = project_actions.browse_project_files,
        ['s'] = project_actions.search_in_project_files,
        ['R'] = project_actions.recent_project_files,
        ['w'] = project_actions.change_working_directory,
        ['o'] = project_actions.next_cd_scope,
      },
      i = {
        ['<c-d>'] = project_actions.delete_project,
        ['<c-v>'] = project_actions.rename_project,
        ['<c-a>'] = project_actions.add_project,
        ['<c-A>'] = project_actions.add_project_cwd,
        ['<c-f>'] = project_actions.find_project_files,
        ['<c-b>'] = project_actions.browse_project_files,
        ['<c-s>'] = project_actions.search_in_project_files,
        ['<c-r>'] = project_actions.recent_project_files,
        ['<c-l>'] = project_actions.change_working_directory,
        ['<c-o>'] = project_actions.next_cd_scope,
      }
    }
  }
}
