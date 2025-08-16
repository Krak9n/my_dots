vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.cmd("let g:netrw_liststyle = 3")


local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))

end

nvim_tree.setup {
    filters = { dotfiles = false, git_ignored = false },
    auto_reload_on_write = true,
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = 40,
        side = "left",
        preserve_window_proportions = false,
        number = true,
        relativenumber = true,
        signcolumn = "yes",
    },
    update_focused_file = { enable = true, update_root = false, ignore_list = {} },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "all",
        highlight_modified = "none",
        root_folder_label = ":~:s?$?/..?",
        --indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
    }

  --[[view = {
    width = 40,
  }, 
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    untracked = "U",
    deleted = "",
    ignored = "◌",
  },]]

  --renderer = {
    --group_empty = true,
  --},
  
}
--[[ require("nvim-tree").setup {

  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 40,
  },
  renderer = {
    group_empty = true,]]
    --[[  git = {
        unstaged = "",
        staged = "S",
        unmerged = "",
        renamed = "➜",
        untracked = "U",
        deleted = "",
        ignored = "◌",
      },]]
  --}, 
  -- filters = {
    --dotfiles = false,
 -- },
  --on_attach = my_on_attach, 
  
--} 
vim.keymap.set('n','<C-n>', ':NvimTreeFindFileToggle<CR>')
