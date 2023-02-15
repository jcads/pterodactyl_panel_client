module Pterodactyl::Models
  struct AccountDetails
    include JSON::Serializable

    getter id : Int64
    getter admin : Bool
    getter username : String
    getter email : String
    getter first_name : String
    getter last_name : String
    getter language : String
  end
end
