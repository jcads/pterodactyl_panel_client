class Pterodactyl::User
include JSON::Serializable

getter object : String
getter attributes : UserAttributes
# getter meta : UserMetadata

end