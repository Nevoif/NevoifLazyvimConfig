-- lua/plugins/gamified.lua
return {
    -- Vim Be Good (The game)
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },

    -- Speedtyper (Typing practice)
    {
        "NStefan002/speedtyper.nvim",
        branch = "main",
        cmd = "Speedtyper",
        opts = {
            -- You can customize this later
            game_modes = {
                -- Defines available game modes
                rain = {
                    enabled = true,
                },
            },
        },
    },
}
