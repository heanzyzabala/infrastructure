# data "terraform_remote_state" "lightsail_k3s_server" {
#   backend = "remote"
#   config = {
#     organization = "heanzyzabala"
#     workspaces = {
#       name = "infrastructure"
#     }
#   }
# }