local theme = require("theme")

hl.on("hyprland.start", function()
	hl.exec_cmd("dconf write /org/gnome/desktop/interface/cursor-theme \"'$XCURSOR_THEME'\"")
	hl.exec_cmd("dconf write /org/gnome/desktop/interface/cursor-size $XCURSOR_SIZE")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("quickshell")
end)

hl.config({
	general = {
		gaps_in = 8,
		gaps_out = 8,
		border_size = 2,
		col = {
			active_border = { colors = { theme.primary0, theme.complementary0 }, angle = 45 },
			inactive_border = theme.background0 .. "cc",
		},
		layout = "scrolling",
		allow_tearing = true,
	},

	input = {
		kb_layout = "se",
		kb_options = "ctrl:nocaps",
		follow_mouse = 1,
		accel_profile = "flat",
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
			clickfinger_behavior = true,
		},
	},

	misc = {
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		vrr = 1,
	},

	decoration = {
		rounding = 10,
		blur = {
			enabled = true,
			size = 2,
			passes = 1,
		},
		shadow = {
			enabled = false,
		},
	},

	cursor = {
		enable_hyprcursor = true,
		no_break_fs_vrr = 1,
		inactive_timeout = 30,
	},

	binds = {
		hide_special_on_workspace_change = true,
		workspace_center_on = 1,
	},

	scrolling = {
		explicit_column_widths = "0.3, 0.5, 0.7, 1.0",
	},
})

local mainMod = "SUPER"
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("alacritty"))

-- Launch
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("uwsm-app -- alacritty"), { description = "terminal" })
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("uwsm-app -- librewolf"), { description = "browser" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.scripts/bemenu/run.sh"), { description = "run prompt" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.scripts/bemenu/float.sh"), { description = "run floating" })
hl.bind(
	mainMod .. " + P",
	hl.dsp.exec_cmd("uwsm-app -- librewolf --private-window"),
	{ description = "private browser" }
)
hl.bind(
	mainMod .. " + SHIFT + C",
	hl.dsp.exec_cmd("uwsm-app -- hyprpicker --autocopy"),
	{ descriptions = "colour picker" }
)

-- Window
hl.unbind(mainMod .. " + Q")
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "close window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill(), { description = "kill window" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "float window" })
hl.bind(
	mainMod .. " + SHIFT + F",
	hl.dsp.window.fullscreen({ action = "toggle" }),
	{ description = "fullscreen window" }
)

-- Power
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"), { description = "lock" })
hl.bind(mainMod .. " + CTRL + SHIFT + Q", hl.dsp.exec_cmd("~/.scripts/power.sh"), { description = "power options" })

local function bind_vim(f)
	for key, direction in pairs({ H = "l", J = "d", K = "u", L = "r" }) do
		f(key, direction)
	end
end

bind_vim(function(key, direction)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
end)

bind_vim(function(key, direction)
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end)

hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + CTRL + N", hl.dsp.layout("promote"))

local function bind_workspaces(f)
	for i = 1, 10 do
		f((i % 10), i)
	end
	for i = 1, 10 do
		f("F" .. i, 10 + i)
	end
end

bind_workspaces(function(key, workspace)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = workspace }))
end)

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

bind_workspaces(function(key, workspace)
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = workspace }))
end)

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "toggle special" })
hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.window.move({ workspace = "special:magic" }),
	{ description = "move window to special" }
)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "++1" }))
hl.bind(mainMod .. " + page_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + page_down", hl.dsp.focus({ workspace = "++1" }))

hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Audio controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.scripts/set_volume.sh 5%+"), { description = "volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.scripts/set_volume.sh 5%-"), { description = "volume down" })
hl.bind(
	"SHIFT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.scripts/set_volume.sh 1%+"),
	{ description = "slight volume up" }
)
hl.bind(
	"SHIFT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.scripts/set_volume.sh 1%-"),
	{ description = "slight volume down" }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.scripts/toggle_mute.sh"), { description = "toggle mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("~/.scripts/toggle_mic.sh"), { description = "toggle mic mute" })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("~/.scripts/playerctl.sh play-pause"), { description = "media play/pause" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("~/.scripts/playerctl.sh previous"), { description = "next track" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("~/.scripts/playerctl.sh next"), { description = "previous track" })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh screen"), { description = "screenshot fullscreen" })
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh region"), { description = "screenshot region" })
hl.bind(
	"CTRL + Print",
	hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh window"),
	{ description = "screenshot active window" }
)
hl.bind(
	"CTRL + SHIFT + Print",
	hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh window_region"),
	{ description = "screenshot active region" }
)

-- Notification
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("qs ipc call notifications dismissTop"))
hl.bind(mainMod .. " + SHIFT+ W", hl.dsp.exec_cmd("qs ipc call notifications dismissAll"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("qs ipc call notifications action"))

hl.window_rule({ float = true, match = { class = "xdg-desktop-portal-gtk" } })
hl.window_rule({ float = true, match = { title = "Select what to share" } })
hl.window_rule({ float = true, match = { title = "Copying — Dolphin" } })
hl.window_rule({ float = true, match = { class = "file-png" } })
hl.window_rule({ float = true, match = { class = "com.nextcloud.desktopclient.nextcloud" } })

hl.window_rule({ move = { "(monitor_w-window_w-32)", 48 }, match = { class = "com.nextcloud.desktopclient.nextcloud" } })

hl.window_rule({ immediate = true, match = { initial_title = "osu!" } })
hl.window_rule({ immediate = true, match = { class = "steam_app_*" } })

local hostname_handle = io.popen("hostname")
local hostname
if hostname_handle ~= nil then
	hostname = hostname_handle:read("*a"):match("^%s*(.-)%s*$")
	hostname_handle:close()
else
	hostname = ""
end

if hostname == "hitori" then
	hl.monitor({
		output = "DP-1",
		mode = "preferred",
		position = "0x0",
		scale = 1,
		bitdepth = 10,
	})

	local hdmi_disabled = nil
	local function toggle_external()
		if hdmi_disabled == nil then
			hdmi_disabled = hl.get_monitor("DP-1") ~= nil
		end

		hl.monitor({
			output = "HDMI-A-1",
			mode = "preferred",
			position = "auto-right",
			scale = 2,
			bitdepth = 10,
			disabled = hdmi_disabled,
		})

		hdmi_disabled = not hdmi_disabled
	end

	hl.on("hyprland.start", function()
		hl.timer(toggle_external, { timeout = 1000, type = "oneshot" }):set_enabled(true)
	end)
	hl.bind(mainMod .. " + CTRL + P", toggle_external, { description = "reload monitor layout" })
elseif hostname == "milize" then
	hl.monitor({
		output = "eDP-1",
		mode = "1920x1080@120",
		position = "0x0",
		bitdepth = 10,
		scale = 1,
	})

	hl.bind(
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("~/.scripts/set_brightness.sh +5%"),
		{ description = "monitor brightness up" }
	)
	hl.bind(
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("~/.scripts/set_brightness.sh 5-%"),
		{ description = "monitor brightness down" }
	)
	hl.bind(
		"SHIFT + XF86MonBrightnessUp",
		hl.dsp.exec_cmd("~/.scripts/set_brightness.sh +1%"),
		{ description = "monitor brightness up (slightly)" }
	)
	hl.bind(
		"SHIFT + XF86MonBrightnessDown",
		hl.dsp.exec_cmd("~/.scripts/set_brightness.sh 1-%"),
		{ description = "monitor brightness down (slightly)" }
	)

	hl.bind(
		"code:238",
		hl.dsp.exec_cmd("brightnessctl -s -d asus::kbd_backlight s +1"),
		{ description = "keyboard brightness up" }
	)
	hl.bind(
		"code:237",
		hl.dsp.exec_cmd("brightnessctl -s -d asus::kbd_backlight s 1-"),
		{ description = "keyboard brightness down" }
	)
end
