module Pterodactyl
  class Client
    def initialize(url : String, key : String)
      @http_client = HTTP::Client.new url
      @headers = HTTP::Headers{
        "Accept"        => "application/json",
        "Authorizarion" => "Bearer #{key}"
      }
    end

    def get_servers #: Array(Models::Server)
      res = @http_client.get "/api/client", @headers
      pp! res.body
      model = Models::APIResponse(Models::Server).from_json res.body

      pp! model
      # model.data.map &.attributes
    end
  end
end
