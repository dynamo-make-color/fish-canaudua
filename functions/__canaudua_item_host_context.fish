function __canaudua_item_host_context
  if set -q SSH_TTY
    set -g canaudua_host_context_bg $canaudua_host_context_bg_ssh
  else if test $USER = "root"
    set -g canaudua_host_context_bg $canaudua_host_context_bg_root
  else
    set -g canaudua_host_context_bg $canaudua_host_context_bg_normal
  end

  set -l distro_icon
  switch (uname | string lower)
    case darwin
      set distro_icon $canaudua_host_context_icon_mac
    case freebsd openbsd dragonfly
      set distro_icon $canaudua_host_context_icon_bsd
    case linux
      set -l icon_var canaudua_host_context_icon_(__canaudua_detect_distro)
      set -q $icon_var
      and set distro_icon $$icon_var
      or set distro_icon $canaudua_host_context_icon_linux
    case '*'
      set distro_icon '?'
  end
  printf '%s' $distro_icon' ' $USER'@'$hostname
end

function __canaudua_detect_distro
  set -l split_file (string split '=' < /etc/os-release)
  set -l key_index (contains --index ID $split_file) || return
  set -l value (string trim --chars='"' $split_file[(math $key_index + 1)] | string lower)
  echo -n $value
end
