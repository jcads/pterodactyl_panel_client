class Pterodactyl::LocationList
include JSON::Serializable

getter object : String
getter data : Array(Location)
# getter meta : PaginationMeta
end