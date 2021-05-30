status is-interactive; or exit

set -g canaudua_left_prompt_var canaudua_left_prompt_$fish_pid
set -g canaudua_right_prompt_var canaudua_right_prompt_$fish_pid
set -gx canaudua_pid $fish_pid

function fish_prompt
  canaudua_last_status=$status canaudua_last_pipestatus=$pipestatus fish -c "_canaudua_setup $fish_bind_mode" < /dev/null &
  command kill $canaudua_last_pid 2>/dev/null
  set -g canaudua_last_pid (jobs --last --pid)
  builtin disown $canaudua_last_pid 2>/dev/null
  string unescape $$canaudua_left_prompt_var
end

function _canaudua_refresh -v $canaudua_left_prompt_var -v $canaudua_right_prompt_var
  commandline -f repaint
end

function _canaudua_exit -e fish_exit
  set -e canaudua_left_prompt_$fish_pid
  set -e canaudua_right_prompt_$fish_pid
end
