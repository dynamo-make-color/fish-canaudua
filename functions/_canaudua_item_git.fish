function _canaudua_item_git
  __fish_is_git_repository; or return
  set -l current_name

  # Get current information of folder
  set -l branch (git branch --show-current 2>/dev/null)
  set -l tag (git describe --tags --exact-match 2>/dev/null)
  git rev-parse -q --short=7 --is-inside-work-tree HEAD | read -lL is_work_tree commit
  test "$is_work_tree" = true; or return

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

  # Get status of repo and remote repo
  set -l info (git status --porcelain)
  set -l staged (string match -r '^[AMDR].' $info | count)
  set -l dirty (string match -r '^.[AMDR]' $info | count)
  set -l untracked (string match -r '^\?\?' $info | count)
  set -l conflicted (string match -r '^UU' $info | count)
  set -l stashed (git stash list | count)
  git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null | read -l -d \t upstream_behind upstream_ahead

  # Set background of item
  if test $dirty -ne 0 2>/dev/null
    set -U canaudua_git_bg $canaudua_git_bg_dirty
  else if test $staged -ne 0 2>/dev/null
    set -U canaudua_git_bg $canaudua_git_bg_staged
  else
    set -U canaudua_git_bg $canaudua_git_bg_clean
  end

  printf '%s' $current_name
  test $conflicted -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_conflicted $conflicted
  test $staged -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_staged $staged
  test $dirty -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_dirty $dirty
  test $untracked -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_untracked $untracked
  test $stashed -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_stashed $stashed
  test $upstream_behind -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_behind $upstream_behind
  test $upstream_ahead -ne 0 2>/dev/null; and printf ' %s %s' $canaudua_git_icon_ahead $upstream_ahead
end
