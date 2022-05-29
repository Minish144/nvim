local separators = {
    vertical_bar = '┃',
    vertical_bar_thin = '│',
    left = '',
    right = '',
    block = '█',
    left_filled = ' ',
    right_filled = ' ',
    slant_left = ' ',
    slant_left_thin = ' ',
    slant_right = ' ',
    slant_right_thin = ' ',
    slant_left_2 = ' ',
    slant_left_2_thin = ' ',
    slant_right_2 = ' ',
    slant_right_2_thin = ' ',
    left_rounded = '',
    left_rounded_thin = '',
    right_rounded = '',
    right_rounded_thin = '',
    circle = '●'
}

local colors = {
  bg = '#6B6BaB',
  fg = '#FFFFFF',
  black = '#1F1F23',
  subtlegray = '#6B6BaB',
  skyblue = '#50B0F0',
  cyan = '#009090',
  green = '#60A040',
  oceanblue = '#0066cc',
  magenta = '#C26BDB',
  orange = '#FF9000',
  red = '#F17777',
  violet = '#371eb3',
  white = 'none',
  yellow = '#E1E120'
}

local vi_mode_colors = {
  NORMAL = '#FFFFFF',
  OP = '#FFFFFF',
  INSERT = '#FFFFFF',
  VISUAL = '#FFFFFF',
  BLOCK = '#FFFFFF',
  REPLACE = '#FFFFFF',
  ['V-REPLACE'] = '#FFFFFF',
  ENTER = '#FFFFFF',
  MORE = '#FFFFFF',
  SELECT = '#FFFFFF',
  COMMAND = '#FFFFFF',
  SHELL = '#FFFFFF',
  TERM = '#FFFFFF',
  NONE = '#FFFFFF'
}

require('feline').setup {
    disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
    separators = separators,
    colors = colors,
    vi_mode_colors = vi_mode_colors,
}
