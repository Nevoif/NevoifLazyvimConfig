return {
    {
        "theHamsta/nvim-dap-virtual-text",
        lazy = true,
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {
            virt_text_pos = "eol",
            all_frames = false,
            virt_lines = false,
        },
    },
}
