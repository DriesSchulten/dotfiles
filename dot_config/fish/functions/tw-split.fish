function tw-split --description "Split an overnight Timewarrior entry"
    echo "--- Splitting Overnight Entry ---"

    # 1. Ask for times
    read -P "Time you stopped yesterday (e.g. 18:00): " y_stop
    read -P "Time you started today (e.g. 09:00):     " t_start

    # 2. Modify the old entry (@1) to end yesterday
    echo "Stopping yesterday's task at $y_stop..."
    timew modify @1 end "yesterdayT$y_stop"

    # 3. 'Continue' the task to create a new running entry
    echo "Resuming task..."
    timew continue @1

    # 4. Adjust the start time of this new running task
    echo "Setting start time to $t_start..."
    timew modify @1 start "$t_start"

    echo "Done! Task is running."
    timew summary
end