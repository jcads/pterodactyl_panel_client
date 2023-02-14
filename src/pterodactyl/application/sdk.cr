class Pterodactyl::ApplicationSdk
  def initialize(@host : String, @application_token : String)
    @client = HttpClient.new(@host, @application_token)
  end

  private def base_path
    "/api/application"
  end

  private def build_path(resource_path)
    "#{base_path}#{resource_path}"
  end

  def create_user(
    email : String,
    username : String,
    first_name : String,
    last_name : String
  )
    result = @client.post(build_path("/users"), {email: email, username: username, first_name: first_name, last_name: last_name}.to_json)
    User.from_json(result)
  end

  def list_locations
    result = @client.get(build_path("/locations"))
    LocationList.from_json(result)
  end

  def get_location(id : Int32 | Int64 | String)
    result = @client.get(build_path("/locations/#{id}"))
    Location.from_json(result)
  end

  def list_servers
    result = @client.get(build_path("/servers"))
    result
    # ServerList.from_json(result)
  end

  def get_server(id : Int32 | Int64 | String)
    result = @client.get(build_path("/servers/#{id}"))
    result
    # Server.from_json(result)
  end

  def update_server_details(
    id : Int32 | Int64 | String,
    name : String,
    user : Int32,
    external_id : String? = nil,
    description : String? = nil
  )
    result = @client.patch(build_path("/servers/#{id}/details"), body: {id: id.to_i64, name: name, user: user, external_id: external_id, description: description}.to_json)
    result
    # Server.from_json(result)
  end

  def update_server_build(
    id : Int32 | Int64 | String,
    allocation : Int32,
    feature_limits : Hash(String, Int32),
    memory : Int32 = nil,
    swap : Int32 = nil,
    disk : Int32 = nil,
    io : Int32 = nil,
    cpu : Int32 = nil,
    threads : String? = nil
  )
    result = @client.patch(build_path("/servers/#{id}/build"), body: {id: id.to_i64, allocation: allocation, feature_limits: feature_limits, memory: memory, swap: swap, disk: disk, io: io, cpu: cpu, threads: threads}.to_json)
    result
    # Server.from_json(result)
  end

  def update_server_startup(
    startup : String,
    egg : Int32,
    image : String,
    skip_scripts : Bool,
    environment : Hash(String, String) = Hash.new
  )
    result = @client.patch(build_path("/servers/#{id}/startup"), body: {startup: startup, egg: egg, image: image, skip_scripts: skip_scripts, environment: environment}.to_json)
    result
    # Server.from_json(result)
  end

  def create_server(create_server_request : CreateServerRequest)
    result = @client.post(build_path("/servers"), body: create_server_request.as_json)
    result
    # Server.from_json(result)
  end

  def suspend_server(id : Int64 | Int32 | String)
    result = @client.post(build_path("/servers/#{id}/suspend"))
    result # returns a 204
  end

  def unsuspend_server(id : Int64 | Int32 | String)
    result = @client.post(build_path("/servers/#{id}/unsuspend"))
    result # returns a 204
  end

  def reinstall_server(id : Int64 | Int32 | String)
    result = @client.post(build_path("/servers/#{id}/reinstall"))
    result # returns a 204
  end

  def delete_server(id : Int64 | Int32 | String, force : Bool = false)
    if force
      result = @client.delete(build_path("/server/#{id}"))
    else
      result = @client.delete(build_path("/server/#{id}/force"))
    end
    result # returns a 204
  end

  def list_nests
    result = @client.get(build_path("/nests"))
    result
    # NestList.from_json(result)
  end

  def get_nest(id : Int32 | Int64 | String)
    result = @client.get(build_path("/nests/#{id}"))
    result
    # Nest.from_json(result)
  end

  def get_eggs(id : Int64 | Int32 | String)
    result = @client.get(build_path("/nests/#{id}/eggs"))
    result
    # EggList.from_json(result)
  end

  def get_egg(egg_id : Int64 | Int32 | String, nest_id : Int32 | Int64 | String)
    result = @client.get(build_path("/nests/#{nest_id}/eggs/#{egg_id}"))
    result
    # Egg.from_json(result)
  end
end
