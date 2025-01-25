local mini = require("mini.animate")
mini.setup({
    --[[cursor = {
        enable = true,
        timing = mini.gen_timing.quadratic({
            duration = 64, unit = "total"
        }),
    },--]]
    --[[scroll = {
        timing = mini.gen_timing.cubic({
            duration = 32, unit = "total"
        }),
    },--]]
    resize = {
        timing = mini.gen_timing.exponential({
            duration = 6, unit = "total"
        }),
    },
    open = {
        timing = mini.gen_timing.linear({
            duration = 64, unit = "total"
        }),
    },
    close = {
        timing = mini.gen_timing.linear({
            duration = 64, unit = "total"
        }),
    }
})

