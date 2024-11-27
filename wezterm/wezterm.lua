local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

config.enable_tab_bar = true
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true
config.font_size = 11.0
config.color_scheme = "Catppuccin Mocha"

resurrect.periodic_save({
    interval_seconds = 300,
    save_tabs = true,
    save_windows = true,
    save_workspaces = true,
})

tabline.setup({
    options = {
        icons_enabled = true,
        theme = "Catppuccin Mocha",
        color_overrides = {},
        section_separators = {
            left = wezterm.nerdfonts.ple_right_half_circle_thick,
            right = wezterm.nerdfonts.ple_left_half_circle_thick,
        },
        component_separators = {
            left = wezterm.nerdfonts.ple_right_half_circle_thin,
            right = wezterm.nerdfonts.ple_left_half_circle_thin,
        },
        tab_separators = {
            left = wezterm.nerdfonts.ple_right_half_circle_thick,
            right = wezterm.nerdfonts.ple_left_half_circle_thick,
        },
    },
    sections = {
        tabline_a = { "mode" },
        tabline_b = { "workspace" },
        tabline_c = { " " },
        tab_active = {
            "index",
            { "parent", padding = 0 },
            "/",
            { "cwd",    max_length = 30, padding = { left = 0, right = 1 } },
            { "zoomed", padding = 0 },
        },
        tab_inactive = { "index", { "process", padding = { left = 0, right = 1 } } },
        tabline_x = { "ram", "cpu" },
        tabline_y = { "battery" },
        tabline_z = { { "datetime", style = "%Y-%m-%d %H:%M:%S" } },
    },
    extensions = {},
})
tabline.apply_to_config(config)

wezterm.on("gui-startup", function(cmd)
    local _, pane, window = mux.spawn_window(cmd or {})
    local gui_window = window:gui_window()
    gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
    pane:split({})
    pane:activate()
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    { key = "a", mods = "LEADER|CTRL",  action = act.SendKey({ key = "a", mods = "CTRL" }) },

    { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "c", mods = "LEADER",       action = act({ SpawnTab = "CurrentPaneDomain" }) },

    { key = "h", mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER",       action = act.ActivatePaneDirection("Right") },

    { key = "`", mods = "LEADER",       action = act.ActivateLastTab },
    { key = "n", mods = "LEADER",       action = act.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
    { key = "1", mods = "LEADER",       action = act({ ActivateTab = 0 }) },
    { key = "2", mods = "LEADER",       action = act({ ActivateTab = 1 }) },
    { key = "3", mods = "LEADER",       action = act({ ActivateTab = 2 }) },
    { key = "4", mods = "LEADER",       action = act({ ActivateTab = 3 }) },
    { key = "5", mods = "LEADER",       action = act({ ActivateTab = 4 }) },
    { key = "6", mods = "LEADER",       action = act({ ActivateTab = 5 }) },
    { key = "7", mods = "LEADER",       action = act({ ActivateTab = 6 }) },
    { key = "8", mods = "LEADER",       action = act({ ActivateTab = 7 }) },
    { key = "9", mods = "LEADER",       action = act({ ActivateTab = 8 }) },

    { key = "&", mods = "LEADER|SHIFT", action = act({ CloseCurrentPane = { confirm = true } }) },
}

return config
-- vim: ts=2 sts=2 sw=2 et
