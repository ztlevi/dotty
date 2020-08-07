local awful = require("awful")
local gears = require("gears")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen,
            floating = false,
            maximized = false,
            above = false,
            below = false,
            ontop = false,
            sticky = false,
            maximized_horizontal = false,
            maximized_vertical = false
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
            drawBackdrop = true,
            shape = function()
                return function(cr, w, h)
                    gears.shape.rounded_rect(cr, w, h, 8)
                end
            end,
            skip_decoration = true
        }
    }
}
