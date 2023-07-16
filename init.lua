return {
    options = {
        g = {diagnostics_mode = 2, inlay_hints_enabled = false},
        b = {inlay_hints_enabled = false},
        opt = {relativenumber = false}
    },
    icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = ""
    },
    lazy = {git = {timeout = 30, url_format = 'https://hub.fgit.ml/%s.git'}}
    -- require("telescope").load_extension("scope")
}
