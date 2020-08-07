local awful = require("awful")

local altkey = require("configuration.keys.mod").altKey

return awful.util.table.join(
    awful.button(
        {},
        1,
        function(c)
            _G.client.focus = c
            c:raise()
        end
    ),
    awful.button({altkey}, 1, awful.mouse.client.move),
    awful.button({altkey}, 3, awful.mouse.client.resize),
    awful.button(
        {altkey},
        4,
        function()
            awful.layout.inc(1)
        end
    ),
    awful.button(
        {altkey},
        5,
        function()
            awful.layout.inc(-1)
        end
    )
)
