module Pterodactyl::Models
  struct Location
    include JSON::Serializable

    getter id : Int32
    getter short : String?
    getter long : String?
    getter updated_at : Time
    getter created_at : Time
  end
end
