class Pterodactyl::UserAttributes
include JSON::Serializable
getter id : Int64
getter external_id : String?
getter uuid : String
getter username : String?
getter email : String
getter first_name : String
getter last_name : String
getter language : String
getter root_admin : Bool
@[JSON::Field(key: "2fa")]
getter two_factor : Bool
getter created_at : Time
getter updated_at : Time
end
