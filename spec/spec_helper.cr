require "spec"
require "webmock"
Spec.before_each &->WebMock.reset
require "../src/pterodactyl_panel_client"

class WebMockWrapper
  HOST = "p2.hostari.com"
  ROOT = "https://#{HOST}"
  HEADERS = {
    "Authorization" => "Bearer 1234",
    "Content-Type"  => "application/json"
  }

  def self.client_stub(method, body, path = "")
    WebMock.stub(method, "#{ROOT}/api/client#{path}")
    .to_return(status: 200, body: File.read("spec/support/#{body}"), headers: HEADERS)
  end

  def self.application_stub(method, body, path)
    WebMock.stub(method, "#{ROOT}/api/application#{path}")
    .to_return(status: 200, body: File.read("spec/support/#{body}"), headers: HEADERS)
  end
end
