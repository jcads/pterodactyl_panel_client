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

{
  "object": "user",
  "attributes": {
    "id": 9,
    "external_id": null,
    "uuid": "dac03ece-fd51-4e4b-bd4f-a79e3b2794f9",
    "username": "exampleuser",
    "email": "example10@example.com",
    "first_name": "Example",
    "last_name": "User",
    "language": "en",
    "root_admin": false,
    "2fa": false,
    "created_at": "2020-10-29T01:25:12+00:00",
    "updated_at": "2020-10-29T01:25:12+00:00"
  },
  "meta": {
    "resource": "https:\/\/pterodactyl.file.properties\/api\/application\/users\/9"
  }
}