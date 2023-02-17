module Pterodactyl::Models
  struct WebsocketCredentials
    include JSON::Serializable

    getter token : String
    getter socket : String
  end
end
