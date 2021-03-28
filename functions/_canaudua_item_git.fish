function _canaudua_item_git
  __fish_is_git_repository; or return
  set -l current_name

  # Get current information of folder
  set -l branch (git branch --show-current 2>/dev/null)
  set -l tag (git describe --tags --exact-match 2>/dev/null)
  set -l commit (git rev-parse -q --short=7 HEAD)

  if test -n "$branch"
    if test "$branch" != master -a "$branch" != main
      set current_name $canaudua_git_icon_branch' '$branch
    else
      set current_name $canaudua_git_icon_branch
    end
  else if test -n "$tag"
    set current_name $canaudua_git_icon_tag$tag
  else
    set current_name $canaudua_git_icon_commit$commit
  end

  printf '%s' $current_name
end
