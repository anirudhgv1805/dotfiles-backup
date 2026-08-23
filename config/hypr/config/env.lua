
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
-- hl.env(
--     "AQ_DRM_DEVICES",
--     "/dev/dri/by-path/pci-0000:00:02.0-card:/dev/dri/by-path/pci-0000:01:00.0-card"
-- )
-- hl.env("AQ_FORCE_LINEAR_BLIT", "0")




-- hl.env(
--     "AQ_DRM_DEVICES",
--     "/dev/dri/by-path/pci-0000:01:00.0-card:/dev/dri/by-path/pci-0000:00:02.0-card"
-- )


-- hl.env(
--     "AQ_DRM_DEVICES",
--     "/dev/dri/by-path/pci-0000:00:02.0-card"
-- )





hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")


hl.env("AQ_FORCE_LINEAR_BLIT", "0")
hl.env("AQ_NO_MODIFIERS","1")



-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("LANG","en_US.UTF-8")
hl.env("LC_ALL","en_US.UTF-8")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")