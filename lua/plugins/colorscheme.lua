return{
  { 'dasupradyumna/midnight.nvim', 
    lazy = false, 
    priority = 1000 
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    transparent_background_level = 2,
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
}
