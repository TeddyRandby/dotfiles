function check_network_state
  # Check what interface is up
  if test $wireless_state="up"
    set -U network_mode "wireless"
  else if test $wired_state="up"
    set -U network_mode "wired"
  else
    set -U network_mode "No internet connection"
  end
end
