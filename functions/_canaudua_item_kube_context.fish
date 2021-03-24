function _canaudua_item_kube_context
  type -q kubectl; or return
  set -l context (kubectl config current-context 2>/dev/null)
  test -z $context; or printf '⎈ %s' $context
end
