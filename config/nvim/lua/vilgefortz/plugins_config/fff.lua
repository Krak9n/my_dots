require("fff").setup({
  -- UI dimensions and appearance
  base_path = vim.fn.getcwd(),
  prompt = 'cook me ',
  title = 'shit',
  max_results = 100,
  max_threads = 4,
  layout = {
    height = 0.9,
    width = 0.9,
    prompt_position = 'bottom', -- or 'top'
    preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
    preview_size = 0.5,
  },
  preview = {
    enabled = true,
    max_size = 10 * 1024 * 1024, -- Do not try to read files larger than 10MB
    chunk_size = 8192, -- Bytes per chunk for dynamic loading (8kb - fits ~100-200 lines)
    binary_file_threshold = 1024, -- amount of bytes to scan for binary content (set 0 to disable)
    imagemagick_info_format_str = '%m: %wx%h, %[colorspace], %q-bit',
    line_numbers = false,
    wrap_lines = false,
    show_file_info = true,
    filetypes = {
      svg = { wrap_lines = true },
      markdown = { wrap_lines = true },
      text = { wrap_lines = true },
    },
  },

  keymaps = {
    close = '<Esc>',
    select = '<CR>',
    select_split = '<C-s>',
    select_vsplit = '<C-v>',
    select_tab = '<C-t>',
    -- Multiple bindings supported
    move_up = { '<Up>', '<C-p>' },
    move_down = { '<Down>', '<C-n>' },
    preview_scroll_up = '<C-u>',
    preview_scroll_down = '<C-d>',
  },

  -- Highlight groups
  hl = {
    border = 'FloatBorder',
    normal = 'Normal',
    cursor = 'CursorLine',
    matched = 'IncSearch',
    title = 'Title',
    prompt = 'Question',
    active_file = 'Visual',
    frecency = 'Number',
    debug = 'Comment',
  },

  -- Debug options
  debug = {
    show_scores = false,  -- Toggle with F2 or :FFFDebug
  },
})

vim.keymap.set('n', '<Space><Space>', ':FFFFind<CR>')
