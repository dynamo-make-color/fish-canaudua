function _canaudua_item_kube_context
  type -q kubectl; or return
  printf '⎈ %s' (kubectl config current-context)
end
