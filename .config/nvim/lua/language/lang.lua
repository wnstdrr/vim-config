local L = {}

L.lang = {
    languages = {
        { "lua", "vim", "vimdoc", "bash", "c", "llvm", "java", "sql", "html", "css", "vue", "graphql", "php", "phpdoc", "markdown_inline", "comment", "diff", "dockerfile", "yaml", "json", "json5" },
    },
    mason_languages = {
        "lua_ls", "clangd", "jdtls", "jsonls", "lemminx", "sqlls", "intelephense", "pyright", "tsserver", "marksman",
        "graphql", "html", "volar", "tsserver"
    },
    ignore_languages = {
    },
}

L.RegisterLanguages = function(register)
    for _, v in pairs(register) do
        vim.treesitter.language.register(v.language, v.filetype)
    end
end

return L
