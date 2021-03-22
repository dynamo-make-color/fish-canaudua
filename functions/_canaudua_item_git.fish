function _canaudua_item_git
  __fish_is_git_repository; or return
  set -l branch (git branch --show-current 2>/dev/null); or return
  printf '%s' $branch
end
