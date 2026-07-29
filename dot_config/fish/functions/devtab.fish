function devtab
    osascript -e '
    tell application "Ghostty"
        activate
        set win to front window
        set topLeftPane to focused terminal of selected tab of win

        -- Split Right (50% right pane) and launch opencode
        set rightPane to split topLeftPane direction right
        input text "opencode" to rightPane
        send key "enter" to rightPane

        -- Split Left Pane Down (creates bottom-left pane)
        set bottomLeftPane to split topLeftPane direction down

        -- Move focus to the bottom-left pane for active typing
        focus bottomLeftPane
    end tell
    '

    # Launch lazygit in the current (top-left) pane
    lazygit
end