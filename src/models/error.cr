# Describes an error returned by the Panel to an API caller.
module Pterodactyl::Models
  struct ErrorList(T)
    include JSON::Serializable
    getter errors : Array(T)
  end

  struct Error
    include JSON::Serializable
    getter code : String
    getter status : String
    getter detail : String
    getter meta : ErrorMetadata?
  end

  struct ErrorMetadata
    include JSON::Serializable
    getter source_field : String
    getter rule : String
  end
end
