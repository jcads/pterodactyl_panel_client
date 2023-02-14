class Pterodactyl::PaginationDetails
include JSON::Serializable

getter total : Int32
getter count : Int32
getter per_page : Int32
getter current_page : Int32
getter total_pages : Int32
getter links : JSON::Any?
end