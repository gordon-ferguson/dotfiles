#!/bin/bash

# Define available profiles
profiles=("performance" "balanced" "power-saver")

# Get user choice
echo "The current power profile is: $(powerprofilesctl get)"
echo " "
echo "Select a power profile:"
select profile in "${profiles[@]}"; do
  if [[ -n "$REPLY" ]]; then
    # Check if chosen profile is valid
    if [[ $REPLY -le ${#profiles[@]} ]]; then
      selected_profile=${profiles[$REPLY-1]}
      echo "Setting power profile to: $selected_profile"
      
      # Use powerprofilesctl to set the profile
      powerprofilesctl set "$selected_profile"
      break
    else
      echo "Invalid choice. Please select a number from the list."
    fi
  fi
done

