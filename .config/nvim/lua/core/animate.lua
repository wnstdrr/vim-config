--[[
--  █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗███████╗
-- ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██╔════╝
-- ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   █████╗  
-- ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  
-- ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ███████╗
-- ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝
]]--

local mini = require("mini.animate")
mini.setup({
    cursor = {
        timing = mini.gen_timing.linear({
            duration = 64, unit = "total"
        })
    },
    scroll = {
        timing = mini.gen_timing.linear({
            duration = 32, unit = "total"
        })
    },
    resize = {
        timing = mini.gen_timing.linear({
            duration = 6, unit = "total"
        })
    },
    open = {
        timing = mini.gen_timing.linear({
            duration = 64, unit = "total"
        })
    },
    close = {
        timing = mini.gen_timing.linear({
            duration = 64, unit = "total"
        })
    }
})
