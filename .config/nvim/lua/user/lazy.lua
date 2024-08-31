local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return "lazy.nvim is not installed or failed to load."
end

local plugins = {
    { "windwp/nvim-ts-autotag" },
    { import = "plugins" },
    { import = "plugins.lsp" },
}

lazy.setup(plugins)
