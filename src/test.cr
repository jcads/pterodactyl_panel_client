require "./pterodactyl_panel_client"
# client = Pterodactyl::ClientSdk.new("p2.hostari.com", "ptlc_PVCPXuJUQ87tMlN8rmSvQz6rtXJ5G2XMwdkGmBWGUAb")
# account = client.get_account_details
# pp! account

app = Pterodactyl::ApplicationSdk.new("p2.hostari.com", "ptla_laYcdWGQGw70QLIdAlqV5b8wqlMtbw7sViCNhdkKIye")
servers = app.get_server(1)
pp! servers
