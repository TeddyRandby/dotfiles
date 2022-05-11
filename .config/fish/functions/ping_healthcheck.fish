function ping_healthcheck
  set status_ping 0

  set packets (ping -q -w2 -c2 example.com | grep -o "100% packet loss")

  if test -z $packets
    echo 'Connected to the internet'
  else
    echo 'Connected, but no internet'
  end

end
