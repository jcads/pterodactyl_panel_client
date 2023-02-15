module Pterodactyl::Models
  struct Server
    include JSON::Serializable

    getter uuid : String
    getter identifier : String
    getter name : String
    getter node : String
    getter description : String
    getter limits : Limits
    getter feature_limits : FeatureLimits
  end

  struct Limits
    include JSON::Serializable

    getter memory : Int32
    getter swap : Int32
    getter disk : Int32
    getter io : Int32
    getter cpu : Int32
  end

  struct FeatureLimits
    include JSON::Serializable

    getter databases : Int32
    getter allocations : Int32
    getter backups : Int32
  end
end
