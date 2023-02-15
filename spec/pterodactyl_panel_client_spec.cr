require "./spec_helper"

describe Pterodactyl do
  host = "p2.hostari.com"
  root = "https://#{host}"
  headers = {
    "Authorization" => "Bearer 1234",
    "Content-Type"  => "application/json"
  }

  it "retrieve account details" do
    WebMock.stub(:get, "#{root}/api/client/account")
    .to_return(status: 200, body: File.read("spec/support/account_details.json"), headers: headers)

    client = Pterodactyl::ClientSdk.new(host, "client_token")
    account = client.get_account_details

    account.email.should eq("example@example.com")
    account.should be_a(Pterodactyl::Models::AccountDetails)
  end
end
