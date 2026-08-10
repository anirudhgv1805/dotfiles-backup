hl.on("hyprland.start",function (...)
    -- hl.exec_cmd("hyprsunset")
    hl.exec_cmd("hyprpolkitagent")
    -- hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("waybar_launch")
    -- hl.exec_cmd("$HOME/dotfiles-backup/waybar/scripts/auto_hide.sh")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
end)



hl.on("config.reloaded",function (...)
    hl.notification.create({text="Config reloaded",timeout=500,color="#00ff26"})
end)
