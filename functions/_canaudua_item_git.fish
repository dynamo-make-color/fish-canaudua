function _canaudua_item_git
  __fish_is_git_repository; or return
  set -l current_name
  set -l branch (git branch --show-current 2>/dev/null); or return
  set -l tag (git describe --tags --exact-match 2>/dev/null)

  # Get current information of folder
  git rev-parse -q --short=7 HEAD | read -lL commit

  if test -n "$branch"
    if test "$branch" != master -a "$branch" != main
      set current_name $branch
    else
      set current_name ' '
    end
  else if test -n "$tag"
    set current_name $tag
  else
    set current_name $commit
  end

  printf '%s' $current_name
end
