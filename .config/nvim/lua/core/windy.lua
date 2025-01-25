local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local sep = helper.separators
local state = _G.WindLine.state


local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Black = { 'white', 'black' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

local colors_mode = {
    Normal = { 'red', 'black' },
    Insert = { 'green', 'black' },
    Visual = { 'yellow', 'black' },
    Replace = { 'blue_light', 'black' },
    Command = { 'magenta', 'black' },
}

basic.vi_mode = {
    name = 'vi_mode',
    hl_colors = colors_mode,
    text = function()
        return { { '  ', state.mode[2] } }
    end,
}
basic.divider_sloped = {
    hl_colors = colors_mode,
    text = function()
        return { { sep.slant_right, state.mode[2] } }
    end,
}

basic.divider_square = {
    hl_colors = colors_mode,
    text = function()
        return { { '▐', state.mode[2] } }
    end
}

basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = '  %s', show_zero = true }), 'red' },
                { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
                { lsp_comps.lsp_hint({ format = '  %s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}
basic.file = {
    name = 'file',
    hl_colors = colors_mode,
    text = function(_, _, width)
        if width > breakpoint_width then
            return {
                { b_components.cache_file_size(), 'white' },
                { '  ', '' },
                { b_components.cache_file_name(
                    "", 'unique'), state.colors[2] },
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
                { '', ' ' },
                { b_components.file_modified('  '), 'green' },
            }
        else
            return {
                { b_components.cache_file_size(), 'white' },
                { ' ',                            '' },
                { b_components.cache_file_name(
                    "", 'unique'), state.colors[2] },
                --{ ' ', '' },
                { b_components.file_modified('  '), 'green' },
            }
        end
    end,
}
basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
            }
        end
    end,
}
basic.git = {
    name = 'git',
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { git_comps.diff_added({ format = '  %s', show_zero = true }), 'green' },
                { git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
                { git_comps.diff_changed({ format = ' 柳%s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ',                { 'cyan', 'black_light' } },
        { sep.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ',                           { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { sep.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },

    always_active = true,
    show_last_status = true,
}

local explorer = {
    hl_colors = colors_mode,
    filetypes = { 'fern', 'NvimTree', 'lir', 'neo-tree' },
    active = {
        { '  ', { 'black', 'red' } },
        { sep.vertical_bar, { 'red', 'red' } },
        { sep.right_filled, { 'red', 'NormalBg' } },
        { b_components.divider },
        { b_components.file_name(''), { 'white', 'NormalBg' } },
    },
    always_active = true,
    show_last_status = true,
}

basic.lsp_name = {
    width = breakpoint_width,
    name = 'lsp_name',
    hl_colors = {
        magenta = { 'magenta', 'black' },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), 'magenta' },
            }
        end
        return {
            { b_components.cache_file_type({ icon = true }), 'magenta' },
        }
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        basic.divider_sloped,
        basic.vi_mode,
        basic.file,
        basic.lsp_diagnos,
        basic.divider,
        basic.file_right,
        basic.lsp_name,
        basic.git,
        { git_comps.git_branch(), { 'magenta', 'black' }, breakpoint_width },
        { ' ',                    hl_list.Black },
        basic.divider_square,
    },
    inactive = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col,       hl_list.Inactive },
        { b_components.progress,       hl_list.Inactive },
    },
}

windline.setup({
    colors_name = function(colors)
        local kan = require("kanagawa.colors").setup({ theme = "wave" })
        local palette = kan.palette
        -- ADD MORE COLOR HERE ----
        colors.red = palette.autumnRed
        colors.yellow = palette.boatYellow2
        colors.blue = palette.dragonBlue
        colors.green = palette.autumnGreen
        colors.white = palette.dragonBlue
        --colors.black = palette.sumink0
        colors.magenta = palette.oniViolet
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
