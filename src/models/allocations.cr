module Pterodactyl::Models
  struct Allocation
    include JSON::Serializable

    getter id : Int64
    getter ip_alias : String
    getter port : String
    getter notes : String?
    getter is_default : Bool
  end
end
