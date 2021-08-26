function __canaudua_uninstall -e canaudua_uninstall
  set -n | string replace -fr '(^canaudua.*)' 'set -e $1' | source
  functions -e (functions -a | string match -er '^__canaudua_')
end

function __canaudua_install -e canaudua_install
  __canaudua_uninstall
end

bind ' ' __canaudua_show_on_command
bind -M insert ' ' __canaudua_show_on_command
