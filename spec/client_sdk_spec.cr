require "./spec_helper"

describe Pterodactyl::ClientSdk do
  it "retrieve account details" do
    WebMockWrapper.client_stub(:get, "account_details.json", "/account")

    client = Pterodactyl::ClientSdk.new("p2.hostari.com", "client_token")
    account = client.get_account_details

    account.email.should eq("example@example.com")
    account.should be_a(Pterodactyl::Models::AccountDetails)
  end

  it "get servers" do
    WebMockWrapper.client_stub(:get, "server_list.json")

    client = Pterodactyl::ClientSdk.new("p2.hostari.com", "client_token")
    servers = client.get_servers

    servers[0].feature_limits.databases.should eq(5)
    servers.should be_a(Array(Pterodactyl::Models::Server))
  end

  it "get server details" do
    WebMockWrapper.client_stub(:get, "server_details.json", "/servers/1a7ce997")

    client = Pterodactyl::ClientSdk.new("p2.hostari.com", "client_token")
    server = client.get_server_details("1a7ce997")

    server.description.should eq("Matt from Wii Sports")
    server.should be_a(Pterodactyl::Models::Server)
  end
end
