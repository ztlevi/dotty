local awful = require("awful")
local gears = require("gears")
local icons = require("theme.icons")

local tags = {
    {
        icon = icons.cloud,
        type = "emacs",
        defaultApp = "emacs",
        screen = 1
    },
    {
        icon = icons.terminal,
        type = "terminal",
        defaultApp = "alacritty",
        screen = 1
    },
    {
        icon = icons.folder,
        type = "files",
        defaultApp = "nautilus",
        screen = 1
    },
    {
        icon = icons.chrome,
        type = "chrome",
        defaultApp = os.getenv("HOME") .. "/.dotty/desktop/bspwm/bin/launch-browser",
        screen = 1
    },
    {
        icon = icons.social,
        type = "social",
        defaultApp = "station",
        screen = 1
    },
    {
        icon = icons.music,
        type = "music",
        defaultApp = "youtube-music",
        screen = 1
    },
    {
        icon = icons.game,
        type = "game",
        defaultApp = "",
        screen = 1
    },
    {
        icon = icons.lab,
        type = "any",
        defaultApp = "",
        screen = 1
    }
}

awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.max,
    awful.layout.suit.floating
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier
    --awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

gap_size = 10

awful.screen.connect_for_each_screen(
    function(s)
        for i, tag in pairs(tags) do
            awful.tag.add(
                i,
                {
                    icon = tag.icon,
                    icon_only = true,
                    layout = awful.layout.suit.tile,
                    gap_single_client = false,
                    gap = gap_size,
                    screen = s,
                    defaultApp = tag.defaultApp,
                    selected = i == 1
                }
            )
        end
    end
)

_G.tag.connect_signal(
    "property::layout",
    function(t)
        local currentLayout = awful.tag.getproperty(t, "layout")
        if (currentLayout == awful.layout.suit.max) then
            t.gap = 0
        else
            t.gap = gap_size
        end
    end
)
