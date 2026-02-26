#!/bin/zsh

DESKTOP="$HOME/Desktop"

# Warning 1 - osascript dialog
result1=$(osascript -e 'display dialog "⚠️ WARNING ⚠️\n\nThis application may BRICK your system permanently.\nProceeding could result in irreversible damage to your OS." buttons {"No, abort", "Yes, continue"} default button "No, abort" with title "SYSTEM WARNING" with icon caution' 2>&1)

if [[ "$result1" != *"Yes, continue"* ]]; then
    osascript -e 'display dialog "Aborted. Smart choice." buttons {"OK"} default button "OK" with title "Aborted"'
    exit 1
fi

# Warning 2 - osascript dialog
result2=$(osascript -e 'display dialog "🚨 FINAL WARNING 🚨\n\nSERIOUSLY. This WILL brick your system.\nThere is NO going back.\nYour machine will be rendered completely unusable." buttons {"No, abort", "Yes, I am sure"} default button "No, abort" with title "FINAL WARNING" with icon stop' 2>&1)

if [[ "$result2" != *"Yes, I am sure"* ]]; then
    osascript -e 'display dialog "Aborted. Wise decision." buttons {"OK"} default button "OK" with title "Aborted"'
    exit 1
fi

# Create folders on Desktop
mkdir BRICKED{1..10000000000}
