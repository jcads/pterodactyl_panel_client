module Pterodactyl::Models
  struct Server
    include JSON::Serializable

    getter uuid : String
    getter name : String
    getter node : String
    getter description : String
    getter limits : Limits
  end

  struct Limits
    include JSON::Serializable

    getter memory : Int32
    getter swap : Int32
    getter disk : Int32
    getter io : Int32
    getter cpu : Int32
  end
end