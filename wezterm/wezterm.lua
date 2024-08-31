local wezterm = require "wezterm"
local act = wezterm.action
local config = wezterm.config_builder()

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = true
config.font_size = 11.0
config.color_scheme = "Catppuccin Mocha"
config.tab_max_width = 48

local mux = wezterm.mux

-- Return the Tabcurrent_working_dirs current working directory
local function get_cwd(tab)
  return tab.active_pane.current_working_dir.file_path or ""
end

-- Remove all path components and return only the last value
local function remove_abs_path(path)
  return path:gsub("(.*[/\\])(.*)", "%2")
end

-- Return the pretty path of the tab"s current working directory
local function get_display_cwd(tab)
  local current_dir = get_cwd(tab)
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))
  return current_dir == HOME_DIR and "~/" or remove_abs_path(current_dir)
end

-- Pretty format the tab title
local function format_title(tab)
  return " " .. get_display_cwd(tab) .. " "
end

-- Returns manually set title (from `tab:set_title()` or `wezterm cli set-tab-title`) or creates a new one
local function get_tab_title(tab)
  local title = tab.tab_title
  if title and #title > 0 then
      return title
  end
  return format_title(tab)
end

-- Return the name of the running process for display
local function get_process(tab)
  if not tab:active_pane() or tab:active_pane():get_foreground_process_name() == "" then return "[?]" end
  return remove_abs_path(tab:active_pane():get_foreground_process_name())
end

-- Return battery icon; plug if charging or charged otherwise battery icon representing SoC
local function battery_icon(percentage, state)
  if state == "Charging" then
      return wezterm.nerdfonts.md_power_plug
  else 
      if percentage > 80 then return wezterm.nerdfonts.md_battery
      elseif percentage > 60 then return wezterm.nerdfonts.md_battery_80
      elseif percentage > 40 then return wezterm.nerdfonts.md_battery_60
      elseif percentage > 20 then return wezterm.nerdfonts.md_battery_40
      else return wezterm.nerdfonts.md_battery_20 end
  end
end

wezterm.on(
    "gui-startup",
    function(cmd)
        local tab, pane, window = mux.spawn_window(cmd or {})
        local gui_window = window:gui_window()
        gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
        pane:split {}
        pane:activate()
    end
)

wezterm.on(
    "update-right-status",
    function(window, pane)
        local current_color_scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]

        local LEFT_ARROW = utf8.char(0xe0b6)
        local ICON_COLOR = "#000000"
        local TEXT_COLOR = "#cdd6f4"
        local STATUS_BACKGROUND_COLOR = current_color_scheme.tab_bar.inactive_tab_edge

        local colors = current_color_scheme.brights
        local cells = {}

        local process = get_process(window:active_tab())
        table.insert(cells, {process, wezterm.nerdfonts.dev_terminal, colors[2]})

        for _, b in ipairs(wezterm.battery_info()) do
            table.insert(cells, {string.format("%.0f%%", b.state_of_charge * 100), battery_icon(b.state_of_charge * 100, b.state), colors[4]})
        end

        local date = wezterm.strftime "%Y-%m-%d %H:%M:%S"
        table.insert(cells, {date, wezterm.nerdfonts.md_calendar_clock, colors[5]})

        local elements = {}
        local function push(item)
            table.insert(elements, {Foreground = {Color = item[3]}})
            table.insert(elements, {Text = LEFT_ARROW})
            table.insert(elements, {Foreground = {Color = ICON_COLOR}})
            table.insert(elements, {Background = {Color = item[3]}})
            table.insert(elements, {Text = item[2] .. " "})
            table.insert(elements, {Foreground = {Color = TEXT_COLOR}})
            table.insert(elements, {Background = {Color = STATUS_BACKGROUND_COLOR}})
            table.insert(elements, {Text = " " .. item[1] .. " "})
        end

        while #cells > 0 do
            local cell = table.remove(cells, 1)
            push(cell)
        end

        window:set_right_status(wezterm.format(elements))
    end
)

config.leader = {key = "a", mods = "CTRL", timeout_milliseconds = 1000}
config.keys = {
    {key = "a", mods = "LEADER|CTRL", action = act.SendKey {key = "a", mods = "CTRL"}},

    {key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal {domain = "CurrentPaneDomain"}},
    {key = "-", mods = "LEADER", action = act.SplitVertical {domain = "CurrentPaneDomain"}},
    {key = "z", mods = "LEADER", action = "TogglePaneZoomState"},
    {key = "c", mods = "LEADER", action = act {SpawnTab = "CurrentPaneDomain"}},

    {key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left")},
    {key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down")},
    {key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up")},
    {key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right")},

    {key = "`", mods = "LEADER", action = act.ActivateLastTab},
    {key = "n", mods = "LEADER", action = act.ActivateTabRelative(1)},
    {key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1)},
    {key = "1", mods = "LEADER", action = act {ActivateTab = 0}},
    {key = "2", mods = "LEADER", action = act {ActivateTab = 1}},
    {key = "3", mods = "LEADER", action = act {ActivateTab = 2}},
    {key = "4", mods = "LEADER", action = act {ActivateTab = 3}},
    {key = "5", mods = "LEADER", action = act {ActivateTab = 4}},
    {key = "6", mods = "LEADER", action = act {ActivateTab = 5}},
    {key = "7", mods = "LEADER", action = act {ActivateTab = 6}},
    {key = "8", mods = "LEADER", action = act {ActivateTab = 7}},
    {key = "9", mods = "LEADER", action = act {ActivateTab = 8}},

    {key = "&", mods = "LEADER|SHIFT", action = act {CloseCurrentPane = {confirm = true}}}
}

wezterm.on(
    "format-tab-title",
    function(tab, tabs, panes, config, hover, max_width)
        local title = get_tab_title(tab)
        return title
    end
)

return config
