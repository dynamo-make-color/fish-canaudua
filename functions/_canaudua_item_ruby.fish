function _canaudua_item_ruby
  if _canaudua_upglob ruby
    set -l ruby_version (ruby --version | awk '{print $2}')
    printf '%s' $canaudua_ruby_icon' ' $ruby_version
  end
end
