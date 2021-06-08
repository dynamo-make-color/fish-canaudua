function _canaudua_item_go
  type -q go; or return
  _canaudua_upglob go; or return

  set -l go_version (go version | awk '{print substr($3,3)}')
  printf '%s' $canaudua_go_icon' ' $go_version
end
