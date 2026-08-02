local vars = require("config.variables")



-- Keyboard Shortcuts
-- Fan Control
hl.bind(
    "XF86PerformanceMode",
    hl.dsp.exec_cmd("fanboost-toggle")
)

-- Brightness Control

-- Fine shift
hl.bind(vars.secondMod .. "+" .. "XF86MonBrightnessDown", hl.dsp.exec_raw("brightnessctl set 1000- -n 1"),
    { repeating = true, locked = true })
hl.bind(vars.secondMod .. "+" .. "XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl set 1000+ -n 1"),
    { repeating = true, locked = true })


-- Gross Shifts
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_raw("brightnessctl set 10000- -n 1"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_raw("brightnessctl set 10000+ -n 1"), { repeating = true, locked = true })


-- Media Controls
hl.bind("XF86AudioPlay", hl.dsp.exec_raw("playerctl play-pause"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_raw("wpctl set-volume -l 0.9 @DEFAULT_AUDIO_SINK@ 5%+"),
    { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_raw("wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%-"),
    { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_raw("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { repeating = true, locked = true })





hl.bind(vars.mainMod .. " + T", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mainMod .. "+ D", hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. "+" .. vars.secondMod .."+s",hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind(vars.mainMod .. "+" .. "period",hl.dsp.exec_cmd("wofi-emoji"))

hl.bind(
    vars.mainMod .. "+v",
    hl.dsp.exec_raw("cliphist list | wofi --dmenu | cliphist decode | wl-copy && wtype -M ctrl -k v -m ctrl")
)
hl.bind(vars.mainMod .. "+" .. vars.secondMod .. "+" .. "v",hl.dsp.exec_cmd("cliphist wipe"))


hl.bind(
    vars.mainMod .. "+F",
    hl.dsp.window.fullscreen({
        mode = "maximized",
        action = "toggle"
    })
)

-- Touchpad Gestures

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})



local volume_gesture = function(change) hl.exec_cmd("wpctl set-volume -l 0.9 @DEFAULT_AUDIO_SINK@ " .. math.abs(change) .. "%" .. (change<0 and "-" or "+")) end
hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = {
    start = function(e) volume_gesture(-0.25 * e.delta.y) end,
    update = function(e) volume_gesture(-0.25 * e.delta.y) end
  },
})



-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 2 })
-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursorZoom", zoom_level = 1.2, mode = "mult" })
hl.gesture({ fingers = 2, direction = "pinch", mods=vars.mainMod ,action = "cursorZoom", zoom_level = 1, mode = "live" })
-- hl.gesture({})






-- -- Plugins

-- -- Hyprexpo
hl.bind(vars.mainMod .. " + G", function()
    hl.plugin.hyprexpo.expo("toggle")
end)


hl.gesture({
    fingers=4,
    direction="vertical",
    action=function ()
        hl.plugin.hyprexpo.expo("toggle")
    end,

})

-- hl.gesture({
--     fingers = 4,
--     direction = "vertical",
--     action = function()
--         hl.notification.create({
--             text = "4 finger gesture",
--             timeout = 1000
--         })
--     end,
-- })
