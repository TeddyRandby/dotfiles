function check_network_directory
  set -U netroot "/sys/class/net"

  if test -n $wireless; and test -d $netroot/$wireless
    set -U wireless_state "$(cat "$netroot/$wireless/operstate")"
  end

  if test -n $wired; and test -d $netroot/$wired
    set -U wired_state "$(cat "$netroot/$wired/operstate")"
  end

  check_network_state
end

