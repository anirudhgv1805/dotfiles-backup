
hl.workspace_rule({workspace="1",layout="dwindle"})
-- hl.workspace_rule({workspace="2",layout="maximized"})


hl.config({
	general = {
		border_size = 0,
		gaps_in = 2,
		gaps_out = 4,
		col = {
			active_border = "#FFFF0000",
		},
		layout = "dwindle",
        resize_on_border=true,
        hover_icon_on_border=true,
	},
    decoration={
        rounding=5,  
        dim_strength=0.0,
        dim_around=0.1,
        blur = {
            enabled=false,
            new_optimizations=true,
            noise=0.9,
        }
    },
    input={
        -- repeat_rate=3,
        -- repeat_delay=1050,
        natural_scroll=true,

        touchpad={
            natural_scroll=true,
            scroll_factor=1.0,
            clickfinger_behavior=true,
            tap_to_click=true,
            tap_and_drag=true,
            drag_3fg=2,
        }
        
    },
    misc={
        disable_hyprland_logo=true,
    },
    cursor={
        invisible=false,
        -- sync_gsettings_theme=true,
        enable_hyprcursor=true,
    }
})

hl.workspace_rule({default_name="spotify",workspace="7",})