module Pterodactyl::Models
  struct Backup
    include JSON::Serializable

    getter uuid : String
    getter name : String
    getter ignored_files : Array(String)
    getter sha256_hash : String
    getter bytes : Int64
    getter created_at : String
    getter completed_at : String
  end

  struct BackupDownloadable
    include JSON::Serializable

    getter url : String
  end
end
