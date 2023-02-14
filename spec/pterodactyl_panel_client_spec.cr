require "./spec_helper"

describe PterodactylPanelClient do
  it "works" do
    client = Pterodactyl::Client.new("p2.hostari.com", "ptlc_PVCPXuJUQ87tMlN8rmSvQz6rtXJ5G2XMwdkGmBWGUAb")
    client.get_servers
    false.should eq(false)
  end
end
