function _canaudua_uninstall -e canaudua_uninstall
  set -n | string replace -fr '(^canaudua.*)' 'set -e $1' | source
  functions -e (functions -a | string match -er '^_canaudua_')
end

bind ' ' _canaudua_show_on_command
bind -M insert ' ' _canaudua_show_on_command
