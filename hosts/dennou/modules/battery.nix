{pkgs, ...}: {
  systemd.services.battery-monitor = {
    enable = true;
    path = with pkgs; [mimic acpi];
    script = ''
      prev_val=100
      check () {
        [[ $1 -ge $val ]] && [[ $1 -lt $prev_val ]];
      }
      notify () {
        ${pkgs.mimic}/bin/mimic -t \
        "Discharging - $val%, $remaining remaining"
      }
      while true; do
        IFS=: read _ bat0 < <(${pkgs.acpi}/bin/acpi -b)
        IFS=\ , read status val remaining <<<"$bat0"
        val=''${val%\%}
        if [[ $status = Discharging ]]; then
          echo "$val%, $remaining"
          if check 30 || check 25 || check 20; then notify
          elif check 15 || [[ $val -le 10 ]]; then notify -u critical
          fi
        fi
        prev_val=$val
        if [[ $val -gt 30 ]]; then sleep 10m; elif [[ $val -ge 20 ]]; then sleep 5m; else sleep 1m; fi
      done
    '';
  };
}
