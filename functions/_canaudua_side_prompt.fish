function _canaudua_side_prompt
  set -l list_items_var canaudua_$argv[1]_items

  for item in $$list_items_var
    set -l output (_canaudua_item_$item)
    test -z output; and continue
    printf '%s' "$output "
  end
end
