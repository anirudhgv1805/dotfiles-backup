-- require("config.variables")
require("config.monitors")
require("config.autostart")
require("config.gestures")
require("config.workspace")
require("config.dispatchers")
require("config.windows")
require("config.env")
-- require("plugin-config.hyprexpo")

print("Lua loaded")
print(hl)

hl.config({
    misc={
        vrr=1,
    },
    general={
        snap={
            enabled=true,
        }
    },
    gestures={
        workspace_swipe_forever=true,
        workspace_swipe_use_r =true,
        workspace_swipe_create_new=true,
    }
    
})




hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LANG","en_US.UTF-8")
hl.env("LC_ALL","en_US.UTF-8")

