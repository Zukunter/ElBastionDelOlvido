{
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
	lazy = true,
    opts = {
        signs = {
            add          = { text = '┃' }, -- Emerald Green (#187A77)
            change       = { text = '┃' }, -- Gold (#D1902E)
            delete       = { text = '/' },
            topdelete    = { text = '-' },
            changedelete = { text = '||' },
            untracked    = { text = '[]' },
        },
        signcolumn = false,
        current_line_blame = true,
	signs_staged_enable = true,
        -- Tipp: Füge das hier hinzu, um den Blame-Text dezent zu halten
        -- Tip: Add this to keep the blame text subtle
		current_line_blame_formatter = '<author>, <committer_time:%Y-%m-%d> - <summary>',
        current_line_blame_opts = {
            virt_text_pos = 'eol', -- Am Ende der Zeile / At the end of the line
            delay = 500,
        },
    },
},
