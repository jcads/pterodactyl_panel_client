module Pterodactyl
  class ClientSdk
    getter host : String

    def initialize(@host : String, @client_token : String)
      @client = HttpClient.new(@host, @client_token)
    end

    def get_servers : Array(Models::Server)
      res = @client.get(base_path)
      model = Models::APIResponse(Models::Server).from_json res.body

      model.data.map &.attributes
    end

    def get_server_details(identifier : String) : Models::Server
      res = @client.get build_path("/servers/#{identifier}")
      server = Data(Models::Server).from_json res.body
      server.attributes
    end

    def get_account_details : Models::AccountDetails
      res = @client.get build_path("/account")
      user = Models::Data(Models::AccountDetails).from_json res.body
      user.attributes
    end

    def update_email(email : String)
      payload = {"email" => email, "password" => "password"}
      res = @client.put build_path("/account/email"), body: payload.to_json
      # TODO: handle errors
    end

    def get_allocations : Array(Models::Allocation)
      res = @client.get build_path("/servers/#{server.identifier}/network/allocations")
      allocations = Models::APIResponse(Models::Allocations).from_json res.body

      allocations.data.map &.attributes
    end

    def assign_allocation(server : Models::Server) : Models::Allocation
      res = @client.post build_path("/servers/#{server.identifier}/network/allocations")
      allocation = Data(Models::Allocation).from_json res.body
      allocation.attributes
    end

    def set_allocation_notes(server : Models::Server, notes : String, allocation_id : Int64) : Models::Allocation
      payload = {"notes" => notes}
      res = @client.post base_path("/servers/#{server.identifier}/network/allocations/#{allocation_id}"), payload.to_json
      allocation = Data(Models::Allocation).from_json res.body
      allocation.attributes
    end

    def set_primary_allocation(server : Models::Server, allocation_id : Int64) : Models::Allocation
      res = @client.post base_path("/servers/#{server.identifier}/network/allocations/#{allocation_id}/primary")
      allocation = Data(Models::Allocation).from_json res.body
      allocation.attributes
    end

    def unassign_allocation(server : Models::Server, allocation_id : Int64)
      res = @client.post base_path("/servers/#{server.identifier}/network/allocations/#{allocation_id}")
      # TODO: handle error
    end

    def get_backups(server : Models::Server) : Models::Backup
      res = @client.get build_path("/servers/#{server.identifier}/backups")
      backups = APIResponse(Models::Backup).from_json res.body
      backups.data.map &.attributes
    end

    def create_backup(server : Models::Server) : Models::Backup
      res = @client.post build_path("/servers/#{server.identifier}/backups")
      backup = Models::Backup.from_json res.body
      backups.attributes
    end

    def get_backup_details(server : Models::Server, backup_uuid : String) : Models::Backup
      res = @client.get build_path("/servers/#{server.identifier}/backups/#{backup_uuid}")
      backup = Models::Backup.from_json res.body
      backups.attributes
    end

    def backup_download_url(server : Models::Server, backup_uuid : String) : String
      res = @client.get build_path("/servers/#{server.identifier}/backups/#{backup_uuid}/download")
      backup = Data(Models::BackupDownloadable).from_json res.body
      backups.url
    end

    def delete_backup(server : Models::Server, backup_uuid : String) : Models::Backup
      @client.delete build_path("/servers/#{server.identifier}/backups/#{backup_uuid}")
    end

    def rename_server(server : Models::Server, name : String)
      payload = {"name" => name}
      @client.post build_path("/servers/#{server.identifier}/settings/rename"), payload.to_json
    end

    def reinstall_server(server : Models::Server)
      @client.post build_path("/servers/#{server.identifier}/settings/reinstall")
    end

    def websocket_credentials(server : Models::Server) : Models::WebsocketCredentials
      res = @client.get build_path("/servers/#{server.identifier}/websocket")
      creds = APIResponse(Models::WebsocketCredentials).from_json res.body
      creds.data
    end

    def get_server_resource_usage(server : Models::Server)
      res = @client.get build_path("/servers/#{server.identifier}/resources")
      usage = Data(Models::ResourceUsage).from_json res.body
      usage.attributes
    end

    def send_command(server : Models::Server, command : String)
      payload = {"command" => command}
      @client.post build_path("/servers/#{server.identifier}/command"), payload.to_json
    end

    def change_server_state(server : Models::Server, signal : String)
      payload = {"signal" => signal}
      @client.post build_path("/servers/#{server.identifier}/power"), payload.to_json
    end

    private def base_path
      "/api/client"
    end

    private def build_path(resource_path)
      "#{base_path}#{resource_path}"
    end
  end
end
