function _canaudua_item_git
  set -l branch (git branch --show-current 2>/dev/null); or return
  printf '%s' $branch
end
