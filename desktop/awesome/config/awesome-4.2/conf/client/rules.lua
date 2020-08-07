local awful = require("awful")
local beautiful = require("beautiful")

local client_keys = require("conf.client.keys")
local client_buttons = require("conf.client.buttons")

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            border_width = 0,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            maximized = false,
            maximized_horizontal = false,
            maximized_vertical = false,
            sticky = false,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen,
            size_hints_honor = false,
            fullscreen = false
        }
    },
    {
        rule_any = {name = {"QuakeTerminal"}},
        properties = {skip_decoration = true}
    },
    {
        rule_any = {class = "Gnome-control-center"},
        properties = {floating = true}
    },
    {
        rule = {name = "Emacs_1"},
        properties = {tag = "1"}
    },
    {
        rule = {class = "Alacritty_2"},
        properties = {tag = "2"}
    },
    {
        rule = {class = "Google-chrome"},
        properties = {tag = "4"}
    },
    {
        rule = {name = "Slack"},
        properties = {tag = "5"}
    },
    -- Titlebars
    {
        rule_any = {type = {"dialog"}, class = {"Wicd-client.py", "calendar.google.com"}},
        properties = {
            placement = awful.placement.centered,
            ontop = true,
            floating = true,
            drawBackdrop = true
        }
    },
    {
        rule = {class = "Peek"},
        properties = {fullscreen = true, sticky = true, ontop = true, floating = true}
    }
}
