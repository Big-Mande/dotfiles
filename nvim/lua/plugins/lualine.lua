-- install lualine
-- set 12 hr lualine clock 
 return { { "nvim-lualine/lualine.nvim", opts = 
 { sections = { lualine_z = { function() return " " .. os.date("%r") end, }, }, }, }, }
