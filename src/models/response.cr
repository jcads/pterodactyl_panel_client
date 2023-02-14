module Pterodactyl::Models
  struct APIResponse(T)
    include JSON::Serializable

    getter data : Array(Data(T))
  end

  struct Data(T)
    include JSON::Serializable

    getter object : String
    getter attributes : T
  end
end