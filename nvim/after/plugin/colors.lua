function ColorMyPencils(color)
  color = color or 'tokyonight'
  vim.cmd('colorscheme ' .. color)

  vim.g.tokyonight_style = "day" -- Set the style to day

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end
ColorMyPencils()


