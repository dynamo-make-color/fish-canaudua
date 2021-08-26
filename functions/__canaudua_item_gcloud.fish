function __canaudua_item_gcloud
  type -q gcloud; or return
  if set -q canaudua_show_gcloud
    set -l account (gcloud config get-value account)
    set -l project (gcloud config get-value project)
    test -z $account; or printf '%s' $canaudua_gcloud_icon' ' $account' : '$project
  end
end
