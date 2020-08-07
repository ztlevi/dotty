local wibox = require("wibox")
local clickable_container = require("widget.material.clickable-container")
local dpi = require("beautiful").xresources.apply_dpi
local gears = require("gears")
local awful = require("awful")

local widget =
    wibox.widget {
    {
        id = "icon",
        widget = wibox.widget.imagebox,
        resize = true
    },
    layout = wibox.layout.align.horizontal
}

widget.icon:set_image(os.getenv("HOME") .. "/.config/awesome/theme/icons/settings-white.svg")

local widget_button = clickable_container(wibox.container.margin(widget, dpi(14), dpi(14), dpi(4), dpi(14)))
widget_button:buttons(
    gears.table.join(
        awful.button(
            {},
            1,
            nil,
            function()
                awful.spawn.with_shell("settings")
            end
        )
    )
)

awful.tooltip(
    {
        objects = {widget_button},
        mode = "outside",
        align = "right",
        timer_function = function()
            return "System settings"
        end,
        preferred_positions = {"right", "left", "top", "bottom"},
        margin_leftright = dpi(8),
        margin_topbottom = dpi(8)
    }
)

return widget_button
