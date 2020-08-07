local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local modkey = require("conf.keys.mod").modKey
local altkey = require("conf.keys.mod").altKey
local apps = require("conf.apps")

-- Key bindings
local globalKeys =
    awful.util.table.join(
    -- Hotkeys
    awful.key({modkey}, "F1", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
    awful.key({modkey}, "Tab", awful.tag.history.restore, {description = "go back", group = "tag"}),
    awful.key(
        {altkey},
        "Tab",
        function()
            awful.spawn(apps.default.rofi_window)
        end,
        {description = "rofi switch windows", group = "awesome"}
    ),
    -- Tag browsing
    awful.key({modkey}, "k", awful.tag.viewprev, {description = "view previous", group = "tag"}),
    awful.key({modkey}, "j", awful.tag.viewnext, {description = "view next", group = "tag"}),
    awful.key(
        {modkey},
        "h",
        function()
            awful.screen.focus_relative(1)
        end,
        {description = "focus the next screen", group = "screen"}
    ),
    awful.key(
        {modkey},
        "l",
        function()
            awful.screen.focus_relative(-1)
        end,
        {description = "focus the previous screen", group = "screen"}
    ),
    -- Focus client by global direction
    awful.key(
        {altkey},
        "h",
        function()
            awful.client.focus.global_bydirection("left")
        end,
        {description = "focus left by global direction", group = "client"}
    ),
    awful.key(
        {altkey},
        "l",
        function()
            awful.client.focus.global_bydirection("right")
        end,
        {description = "focus right by global direction", group = "client"}
    ),
    awful.key(
        {altkey},
        "k",
        function()
            awful.client.focus.global_bydirection("up")
        end,
        {description = "focus up by global direction", group = "client"}
    ),
    awful.key(
        {altkey},
        "j",
        function()
            awful.client.focus.global_bydirection("down")
        end,
        {description = "focus down by global direction", group = "client"}
    ),
    -- Swap client by direction across screen
    awful.key(
        {altkey, "Control"},
        "l",
        function()
            awful.client.swap.global_bydirection("right")
        end,
        {description = "swap with right client by global direction", group = "client"}
    ),
    awful.key(
        {altkey, "Control"},
        "h",
        function()
            awful.client.swap.global_bydirection("left")
        end,
        {description = "swap with left client by global direction", group = "client"}
    ),
    awful.key(
        {altkey, "Control"},
        "j",
        function()
            awful.client.swap.global_bydirection("down")
        end,
        {description = "swap with down client by global direction", group = "client"}
    ),
    awful.key(
        {altkey, "Control"},
        "k",
        function()
            awful.client.swap.global_bydirection("up")
        end,
        {description = "swap with up client by global direction", group = "client"}
    ),
    -- Move client between tags and screens
    awful.key(
        {modkey, "Shift"},
        "k",
        function()
            -- get current tag
            local t = client.focus and client.focus.first_tag or nil
            if t == nil then
                return
            end
            -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
            local tag = client.focus.screen.tags[(t.name - 2) % 8 + 1]
            awful.client.movetotag(tag)
            awful.tag.viewprev()
        end,
        {description = "move client to previous tag and switch to it", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "j",
        function()
            -- get current tag
            local t = client.focus and client.focus.first_tag or nil
            if t == nil then
                return
            end

            -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
            local tag = client.focus.screen.tags[(t.name % 8) + 1]
            awful.client.movetotag(tag)
            awful.tag.viewnext()
        end,
        {description = "move client to next tag and switch to it", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "h",
        function()
            local c = client.focus
            if c then
                c:move_to_screen((awful.screen.focused().index - 2) % screen:count() + 1)
            end
        end,
        {description = "move client to previous screen and switch to it", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "l",
        function()
            local c = client.focus
            if c then
                c:move_to_screen(awful.screen.focused().index % screen:count() + 1)
            end
        end,
        {description = "move client to next screen and switch to it", group = "layout"}
    ),
    awful.key(
        {modkey, "Shift"},
        "o",
        function()
            local c = client.focus
            if c then
                c:move_to_screen()
            end
        end,
        {description = "Move focused window on next screen", group = "Screens management"}
    ),
    awful.key(
        {modkey},
        "space",
        function()
            _G.screen.primary.left_panel:toggle(true)
        end,
        {description = "show main menu", group = "awesome"}
    ),
    awful.key({modkey}, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
    awful.key(
        {altkey},
        "o",
        function()
            awful.client.focus.history.previous()
            if _G.client.focus then
                _G.client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}
    ),
    -- Programms
    awful.key(
        {altkey, "Control"},
        "q",
        function()
            awful.spawn(apps.default.lock)
        end
    ),
    awful.key(
        {altkey, "Shift"},
        "s",
        function()
            awful.util.spawn_with_shell("maim -s | xclip -selection clipboard -t image/png")
        end
    ),
    -- Standard program
    awful.key(
        {modkey},
        "Return",
        function()
            awful.spawn(apps.default.terminal)
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key(
        {modkey},
        "o",
        function()
            awful.spawn.with_shell("xdg-open ~/Downloads")
        end,
        {description = "open a terminal", group = "launcher"}
    ),
    awful.key({modkey}, "Escape", _G.awesome.restart, {description = "reload awesome", group = "awesome"}),
    awful.key({modkey, "Control", "Shift"}, "e", _G.awesome.quit, {description = "quit awesome", group = "awesome"}),
    awful.key(
        {altkey, modkey},
        "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        {description = "increase master width factor", group = "layout"}
    ),
    awful.key(
        {altkey, modkey},
        "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        {description = "decrease master width factor", group = "layout"}
    ),
    awful.key(
        {modkey},
        "n",
        function()
            awful.layout.inc(1)
        end,
        {description = "select next", group = "layout"}
    ),
    awful.key(
        {modkey},
        "p",
        function()
            awful.layout.inc(-1)
        end,
        {description = "select previous", group = "layout"}
    ),
    awful.key(
        {altkey, "Shift"},
        "h",
        function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                _G.client.focus = c
                c:raise()
            end
        end,
        {description = "restore minimized", group = "client"}
    ),
    -- Dropdown application
    awful.key(
        {modkey},
        "`",
        function()
            _G.toggle_quake()
        end,
        {description = "dropdown application", group = "launcher"}
    ),
    -- Widgets popups
    awful.key(
        {altkey},
        "h",
        function()
            if beautiful.fs then
                beautiful.fs.show(7)
            end
        end,
        {description = "show filesystem", group = "widgets"}
    ),
    awful.key(
        {altkey, "Shift"},
        "w",
        function()
            if beautiful.weather then
                beautiful.weather.show(7)
            end
        end,
        {description = "show weather", group = "widgets"}
    ),
    -- Brightness
    awful.key(
        {},
        "XF86MonBrightnessUp",
        function()
            awful.spawn("xbacklight -inc 10")
        end,
        {description = "+10%", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86MonBrightnessDown",
        function()
            awful.spawn("xbacklight -dec 10")
        end,
        {description = "-10%", group = "hotkeys"}
    ),
    -- ALSA volume control
    awful.key(
        {},
        "XF86AudioRaiseVolume",
        function()
            awful.spawn("amixer -D pulse sset Master 5%+")
        end,
        {description = "volume up", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioLowerVolume",
        function()
            awful.spawn("amixer -D pulse sset Master 5%-")
        end,
        {description = "volume down", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioMute",
        function()
            awful.spawn("amixer -D pulse set Master 1+ toggle")
        end,
        {description = "toggle mute", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86AudioNext",
        function()
            --
        end,
        {description = "toggle mute", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86PowerDown",
        function()
            --
        end,
        {description = "toggle mute", group = "hotkeys"}
    ),
    awful.key(
        {},
        "XF86PowerOff",
        function()
            _G.exit_screen_show()
        end,
        {description = "toggle mute", group = "hotkeys"}
    )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalKeys =
        awful.util.table.join(
        globalKeys,
        -- View tag only.
        awful.key(
            {modkey},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            descr_view
        ),
        -- Toggle tag display.
        awful.key(
            {modkey, "Control"},
            "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            descr_toggle
        ),
        -- Move client to tag.
        awful.key(
            {modkey, "Shift"},
            "#" .. i + 9,
            function()
                if _G.client.focus then
                    local tag = _G.client.focus.screen.tags[i]
                    if tag then
                        _G.client.focus:move_to_tag(tag)
                    end
                end
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            descr_move
        ),
        -- Toggle tag on focused client.
        awful.key(
            {modkey, "Control", "Shift"},
            "#" .. i + 9,
            function()
                if _G.client.focus then
                    local tag = _G.client.focus.screen.tags[i]
                    if tag then
                        _G.client.focus:toggle_tag(tag)
                    end
                end
            end,
            descr_toggle_focus
        )
    )
end

return globalKeys
