module Pterodactyl::Models
  struct Nest
    include JSON::Serializable

    getter id : Int64
    getter uuid : String
    getter author : String
    getter name : String
    getter description : String
    getter created_at : Time
    getter updated_at : Time
  end
end
