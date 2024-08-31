local function setup_tree()
    local view = {
        side = "left",
        number = true,
        width = 30,
        relativenumber = true,
    }

    local renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            modified_placement = "after",
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
                modified = true,
            },
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "D",
                    ignored = "◌",
                },
            },
        },
    }

    require("nvim-tree").setup({
        on_attach = map_on_attach,
        view = view,
        renderer = renderer,
        update_focused_file = {
            update_root = true,
        },
    })
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = setup_tree,
}
