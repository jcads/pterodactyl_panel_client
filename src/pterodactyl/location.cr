class Pterodactyl::Location
include JSON::Serializable

getter object : String
getter attributes : LocationAttributes
end