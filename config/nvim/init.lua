require "obimel.globals"

require "obimel.packer"

require "obimel.darkmagic"

-- telescope
require "obimel.telescope"

-- dap
require "obimel.debugger"

--TODO: try folke/lazy.nvim (https://github.com/folke/lazy.nvim)
--
--local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
--if not vim.loop.fs_stat(lazypath) then
--  vim.fn.system({
--    "git",
--    "clone",
--    "--filter=blob:none",
--    "https://github.com/folke/lazy.nvim.git",
--    "--branch=stable", -- latest stable release
--    lazypath,
--  })
--end
--vim.opt.rtp:prepend(lazypath)
